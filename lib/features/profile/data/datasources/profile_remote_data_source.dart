import 'package:haya/core/networking/api_service.dart';
import 'package:haya/features/profile/constants/profile_api_constants.dart';
import '../models/profile_model.dart';

class ProfileRemoteDataSource {
  final ApiService apiService;
  ProfileRemoteDataSource({required this.apiService});

  Future<UserModel> getProfileData() async {
    final response = await apiService.get(
      endpoint: ProfileApiConstants.profile,
    );
    return UserModel.fromJson(response.data);
  }
}
