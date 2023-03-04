import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:my_base_flutter/services/local_storage/secure_storage_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

part 'app_dio.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return AppDio.getInstance(ref.read(secureStorageServiceProvider));
}

const kTimeout = 30000;

class AppDio with DioMixin implements Dio {
  AppDio._(SecureStorageService? secureStorageService) {
    options = BaseOptions(
      baseUrl: "https://api.staging.snapmart.ph/v1/",
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    // Firebase Performance
    // interceptors.add(DioFirebasePerformanceInterceptor());

    interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
    ));

    interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers.addAll(await userAgentClientHintsHeader());

      String token = await secureStorageService!.getToken();
      if (token.isNotEmpty) {
        print("Get token:" + token);
        options.headers["Authorization"] = "Bearer " + token;
      }
      // Do something before request is sent
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onError: (DioError e, handler) {
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
    }));

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance(SecureStorageService? secureStorageService) =>
      AppDio._(secureStorageService);
}
