import 'package:haya/core/networking/api_service.dart';
import 'package:haya/features/home/constants/home_api_constants.dart';
import 'package:haya/features/home/data/models/task_model.dart';

class HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSource({required this.apiService});

  Future<List<TaskModel>> getTodos() async {
    final response = await apiService.get(endpoint: HomeApiConstants.todos);
    return (response.data as List).map((e) => TaskModel.fromJson(e)).toList();
  }

  Future<void> createTodo({
    required String title,
    required String description,
  }) async {
     await apiService.post(
      endpoint: HomeApiConstants.todos,
      body: {'title': title, 'description': description},
    );
  }

  Future<void> updateTodo({
    required int id,
    required String status,
    required String title,
    required String description,
  }) async {
     await apiService.put(
      endpoint: HomeApiConstants.updateTodo(id),
      body: {'title': title, 'description': description, 'status': status},
    );
  }

  Future<void> deleteTodo({required int id}) async {
    await apiService.delete(endpoint: HomeApiConstants.updateTodo(id));
  }
}
