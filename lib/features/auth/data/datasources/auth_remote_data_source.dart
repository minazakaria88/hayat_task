import 'package:haya/core/networking/api_service.dart';
import 'package:haya/features/auth/constants/auth_endpoints.dart';


class AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteDataSource({required this.apiService});

  Future<void> login({required String email, required String password}) async {
    await apiService.post(
      endpoint: AuthEndpoints.login,
      body: {'email': email, 'password': password},
    );
  }
}
