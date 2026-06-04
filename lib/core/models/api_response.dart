import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_response.g.dart';
part 'api_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required  String ? message,
    final T? result,
    //final Pagination? pagination,
    final DateTime? timestamp,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    final Map<String, dynamic> json,
    final T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}