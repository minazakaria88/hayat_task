import 'package:haya/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:haya/features/auth/data/datasources/auth_remote_data_source.dart';

class AuthRepo {
  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDataSource remoteDataSource;
  AuthRepo({required this.authLocalDataSource, required this.remoteDataSource});

  Future<void> login({required String email, required String password}) async {
    await remoteDataSource.login(email: email, password: password);
    await authLocalDataSource.saveToken('token');
  }
}
