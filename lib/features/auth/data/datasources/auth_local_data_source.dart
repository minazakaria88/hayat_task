import 'package:haya/core/helpers/extensions.dart';
import 'package:haya/core/services/cache_helper.dart';

class AuthLocalDataSource {
  Future<void> saveToken(String token) async {
    await CacheHelper.setSecureString(CacheHelperKeys.token, token);
  }


  Future<bool> checkTokenIsExist() async {
    final token = await CacheHelper.getSecureString(CacheHelperKeys.token);
    return !token.isNullOrEmpty();
  }

  Future<void> logout() async {
    await CacheHelper.clearData();
  }
}