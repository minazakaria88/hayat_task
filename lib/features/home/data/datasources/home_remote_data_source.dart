import 'package:haya/core/networking/api_service.dart';
import 'package:haya/features/home/constants/home_api_constants.dart';
import 'dart:developer';

class HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSource({required this.apiService});


  Future<void> getProfileData() async {
    final response = await apiService.get(endpoint: HomeApiConstants.profile);
    log(response.data);
  }
}