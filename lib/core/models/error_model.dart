import 'package:freezed_annotation/freezed_annotation.dart';
part 'error_model.freezed.dart';
part 'error_model.g.dart';

@freezed
abstract class ErrorModel with _$ErrorModel {
  const factory ErrorModel({
    required String message,
    required Map<String, dynamic> errors,
  }) = _ErrorModel;

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
}