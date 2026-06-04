import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:haya/core/errors/failure.dart';
import 'package:haya/core/networking/api_contants.dart';
import 'package:haya/core/networking/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConstants {
  static const String accept = 'application/json';
  static const String contentType = 'application/json';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';
  static const String acceptLanguage = 'Accept-Language';
}

class ApiService {
  static Dio? dio;

  static init() {
    log('init api service');
    final timeoutDuration = const Duration(seconds: 30);
    dio = Dio();
    dio
      ?..options.baseUrl = ApiConstants.apiBaseUrl
      ..options.connectTimeout = timeoutDuration
      ..options.receiveTimeout = timeoutDuration
      ..options.sendTimeout = timeoutDuration
      ..options.receiveDataWhenStatusError = true;

    final authInterceptor = AuthInterceptor();
    dio?.interceptors.addAll([
      authInterceptor,
      if (kDebugMode) PrettyDioLogger(requestBody: true, requestHeader: true),
    ]);
  }

  Future<Response> get({
    required final String endpoint,
    final Map<String, dynamic>? queryParameters,
    final dynamic body,
  }) async {
    try {
      final response = await dio!.get(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (error) {
      throw CustomException(error.toString());
    }
  }

  Future<Response> post({
    required final String endpoint,
    required final dynamic body,
    final List? listBody,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
  }) async {
    try {
      final response = await dio!.post(
        endpoint,
        data: listBody ?? body,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (error) {
      throw CustomException(error.toString());
    }
  }

  Future<Response> put({
    required final String endpoint,
    required final Map<String, dynamic> body,
    final Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio!.put(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (error) {
      throw CustomException(error.toString());
    }
  }

  Future<Response> delete({
    required final String endpoint,
    final Map<String, dynamic>? queryParameters,
    final dynamic body,
  }) async {
    try {
      final response = await dio!.delete(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (error) {
      throw CustomException(error.toString());
    }
  }

  Future<Response> postMultipart({
    required final String endpoint,
    required final FormData formData,
    final Map<String, dynamic>? queryParameters,
    final void Function(int, int)? onSendProgress,
  }) async {
    try {
      final response = await dio!.post(
        endpoint,
        data: formData,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (error) {
      throw CustomException(error.toString());
    }
  }
}
