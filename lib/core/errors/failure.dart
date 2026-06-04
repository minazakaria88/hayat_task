import 'package:dio/dio.dart';
import 'package:haya/core/models/error_model.dart';


abstract class Failure {
  Failure(this.message);
  final String message;

  @override
  String toString() {
    return message;
  }
}

class ServerFailure extends Failure {
  factory ServerFailure.fromDiorError(final DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          'Connection timeout with api server',
          statusCode: e.response?.statusCode,
          error: e.response?.data,
        );

      case DioExceptionType.sendTimeout:
        return ServerFailure(
          'Send timeout with ApiServer',
          statusCode: e.response?.statusCode,
          error: e.response?.data,
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          'Receive timeout with ApiServer',
          statusCode: e.response?.statusCode,
          error: e.response?.data,
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          'badCertificate with api server',
          statusCode: e.response?.statusCode,
          error: e.response?.data,
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!);
      case DioExceptionType.cancel:
        return ServerFailure(
          'Request to ApiServer was canceld',
          statusCode: e.response?.statusCode,
          error: e.response?.data,
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          'No Internet Connection',
          statusCode: e.response?.statusCode,
          error: e.response?.data,
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          'Oops! There was an Error, Please try again',
          statusCode: e.response?.statusCode,
          error: e.response?.data,
        );
    }
  }

  factory ServerFailure.fromResponse(final Response response) {
   
    ErrorModel? errorModel;
    if (response.data is Map<String, dynamic>) {
      errorModel = ErrorModel.fromJson(response.data as Map<String, dynamic>);
    }

     var message = '';
    if (errorModel != null && errorModel.details.isNotEmpty) {
      message = errorModel.details
          .map((final error) => '\u202A$error\u202C')
          .join('\n');
    }

    // Fallback to title if details are empty
    if (message.isEmpty && errorModel != null) {
      message = errorModel.title;
    }

    // Final fallback generic message
    if (message.isEmpty) {
      message = 'Oops! There was an Error, Please try again';
    }

    return ServerFailure(
      message,
      statusCode: response.statusCode,
      error: response.data?.toString(),
    );
  }

  ServerFailure(super.message, {this.statusCode, this.error});
  final int? statusCode;
  final String? error;
}

class CustomException extends Failure {
  CustomException(super.message);

  @override
  String toString() => message;
}
