import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_base_flutter/app_provider.dart';
import 'package:my_base_flutter/routing/app_router.gr.dart';
import 'package:my_base_flutter/services/local_storage/secure_storage_service.dart';
import 'package:my_base_flutter/services/networking/model/api_exception.dart';

class ApiExceptions {
  ApiExceptions(DioError e, Ref ref) {
    if (e.response != null) {
      if (e.response?.statusCode == HttpStatus.unauthorized) {
        print("Token is expired!");
        ref.read(secureStorageServiceProvider).clearToken();

        ref.invalidate(secureStorageServiceProvider);
        final appRouter = ref.watch(appRouterProvider);
        appRouter.replace(const LoginRoute());
      }
      throw ApiException.fromJson(e.response?.data["errors"]);
    } else {
      switch (e.type) {
        case DioErrorType.other:
          if (e.error is SocketException) {
            // SocketException: Failed host lookup: '***'
            // (OS Error: No address associated with hostname, errno = 7)
            throw const ApiException(message: "Network error!");
          } else {}
          break;
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.response:
          switch (e.response?.statusCode) {
            case HttpStatus.badRequest: // 400
            case HttpStatus.unauthorized: // 401
            case HttpStatus.internalServerError: // 500
            case HttpStatus.badGateway: // 502
            case HttpStatus.serviceUnavailable: // 503
            case HttpStatus.gatewayTimeout: // 504
            default:
          }
          break;
        case DioErrorType.cancel:
        default:
      }
    }
  }
}
