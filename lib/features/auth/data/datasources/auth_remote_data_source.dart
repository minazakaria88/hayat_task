import 'package:haya/core/networking/api_service.dart';
import 'package:haya/features/auth/constants/auth_endpoints.dart';

class AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteDataSource({required this.apiService});

  Future<String> login({required String email, required String password}) async {
   final response = await apiService.post(
      endpoint: AuthEndpoints.login,
      body: {'email': email, 'password': password},
    );
    return response.data['token'];
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    await apiService.post(
      endpoint: AuthEndpoints.register,
      body: {'email': email, 'password': password, 'name': name},
    );
  }
}
