import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_base_flutter/exceptions/api_exceptions.dart';
import 'package:my_base_flutter/services/networking/app_dio.dart';

class BaseDioMethod {
  BaseDioMethod(this.ref);

  final Ref ref;

  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers}) async {
    try {
      final response = await ref.read(dioProvider).get(path,
          queryParameters: queryParameters, options: Options(headers: headers));
      return response.data;
    } on DioError catch (e) {
      ApiExceptions(e, ref);
    }
  }

  Future<dynamic> post(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers}) async {
    try {
      final response = await ref.read(dioProvider).post(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return response.data;
    } on DioError catch (e) {
      ApiExceptions(e, ref);
    }
  }

  // Future<dynamic> patch(String path,
  //     {Map<String, dynamic>? data,
  //     Map<String, dynamic>? queryParameters,
  //     Map<String, String>? headers}) async {
  //   final response = await ref.read(dioProvider).patch(path,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: Options(headers: headers));
  //   return _handleResponse(response);
  // }

  // Future<dynamic> upload(String path,
  //     {FormData? data,
  //     Map<String, dynamic>? queryParameters,
  //     Map<String, String>? headers}) async {
  //   final response = await ref.read(dioProvider).post(path,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: Options(headers: headers));
  //   return _handleResponse(response);
  // }

  // Future<dynamic> put(String path,
  //     {dynamic data,
  //     Map<String, dynamic>? queryParameters,
  //     Map<String, String>? headers}) async {
  //   final response = await ref.read(dioProvider).put(path,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: Options(headers: headers));
  //   return _handleResponse(response);
  // }

  // Future<dynamic> delete(String path,
  //     {Map<String, dynamic>? data,
  //     Map<String, dynamic>? queryParameters,
  //     Map<String, String>? headers}) async {
  //   final response = await ref.read(dioProvider).delete(path,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: Options(headers: headers));
  //   return _handleResponse(response);
  // }

  // Future<dynamic> download(String path, String savePath) async {
  //   final response = await ref.read(dioProvider).download(path, savePath);
  //   return _handleResponse(response);
  // }
}
