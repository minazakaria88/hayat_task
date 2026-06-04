// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => _ErrorModel(
  type: json['type'] as String,
  title: json['title'] as String,
  details:
      (json['details'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$ErrorModelToJson(_ErrorModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'details': instance.details,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
