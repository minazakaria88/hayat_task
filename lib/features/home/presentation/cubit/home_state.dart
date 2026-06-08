part of 'home_cubit.dart';



enum GetTasksStatus { initial, loading, success, failure }
enum CreateTaskStatus { initial, loading, success, failure }
enum DeleteTaskStatus { initial, loading, success, failure }
@freezed
abstract class HomeState with _$HomeState {
 const factory HomeState({
  @Default(GetTasksStatus.initial) GetTasksStatus getTasksStatus,
  @Default(CreateTaskStatus.initial) CreateTaskStatus createTaskStatus,
  @Default(DeleteTaskStatus.initial) DeleteTaskStatus deleteTaskStatus,
  @Default(-1) int deletedTaskId,
  String? errorMessage,
  List<TaskModel>? tasks
 }) = _HomeState;
}

