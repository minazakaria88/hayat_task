import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/tasks_constants.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
abstract class TaskModel with _$TaskModel {
  const factory TaskModel({
    required int id,
    required String title,
    required String description,
    required TaskStatus status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}