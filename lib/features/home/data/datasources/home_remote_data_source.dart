import 'package:haya/core/networking/api_service.dart';
import 'package:haya/features/home/constants/home_api_constants.dart';
import 'dart:developer';

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
    final response = await apiService.post(
      endpoint: HomeApiConstants.todos,
      body: {'title': title, 'description': description},
    );
    log(response.data.toString());
  }
}
