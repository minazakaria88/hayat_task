import '../datasources/home_remote_data_source.dart';
import '../models/task_model.dart';

class HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepo({required this.homeRemoteDataSource});

  Future<List<TaskModel>> getTodos() async {
    return homeRemoteDataSource.getTodos();
  }

  Future<void> createTodo({
    required String title,
    required String description,
  }) async {
    homeRemoteDataSource.createTodo(title: title, description: description);
  }
}
