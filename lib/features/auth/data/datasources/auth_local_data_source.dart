import 'package:haya/core/services/cache_helper.dart';

class AuthLocalDataSource {
  Future<void> saveToken(String token) async {
    await CacheHelper.setSecureString(CacheHelperKeys.token, token);
  }
}