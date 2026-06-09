import '../datasources/home_remote_data_source.dart';
import '../models/task_model.dart';

class HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepo({required this.homeRemoteDataSource});

  Future<List<TaskModel>> getTodos() {
    return homeRemoteDataSource.getTodos();
  }

  Future<void> createTodo({
    required String title,
    required String description,
  }) async {
    return homeRemoteDataSource.createTodo(
      title: title,
      description: description,
    );
  }

  Future<void> updateTodo({
    required int id,
    required String status,
    required String title,
    required String description,
  }) async {
    return homeRemoteDataSource.updateTodo(
      id: id,
      status: status,
      title: title,
      description: description,
    );
  }

  Future<void> deleteTodo({required int id}) async {
    return homeRemoteDataSource.deleteTodo(id: id);
  }
}
