import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:haya/features/home/data/datasources/home_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/task_model.dart';
part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRemoteDataSource}) : super(const HomeState());
  final HomeRemoteDataSource homeRemoteDataSource;

  Future<void> getTodos() async {
    try {
      emit(state.copyWith(getTasksStatus: GetTasksStatus.loading));
      final tasks = await homeRemoteDataSource.getTodos();
      emit(
        state.copyWith(getTasksStatus: GetTasksStatus.success, tasks: tasks),
      );
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(
          getTasksStatus: GetTasksStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void createTodo({required String title, required String description}) async {
    try {
      emit(state.copyWith(createTaskStatus: CreateTaskStatus.loading));
      await homeRemoteDataSource.createTodo(
        title: title,
        description: description,
      );
      emit(state.copyWith(createTaskStatus: CreateTaskStatus.success));
      getTodos();
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(
          createTaskStatus: CreateTaskStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
