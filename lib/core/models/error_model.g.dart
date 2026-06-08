// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => _ErrorModel(
  message: json['message'] as String,
  errors: json['errors'] as Map<String, dynamic>,
);

Map<String, dynamic> _$ErrorModelToJson(_ErrorModel instance) =>
    <String, dynamic>{'message': instance.message, 'errors': instance.errors};
