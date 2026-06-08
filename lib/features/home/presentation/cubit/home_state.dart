part of 'home_cubit.dart';



enum GetTasksStatus { initial, loading, success, failure }
enum CreateTaskStatus { initial, loading, success, failure }
@freezed
abstract class HomeState with _$HomeState {
 const factory HomeState({
  @Default(GetTasksStatus.initial) GetTasksStatus getTasksStatus,
  @Default(CreateTaskStatus.initial) CreateTaskStatus createTaskStatus,
  String? errorMessage,
 }) = _HomeState;
}

