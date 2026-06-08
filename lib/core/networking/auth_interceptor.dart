import 'package:dio/dio.dart';
import 'package:haya/core/services/cache_helper.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token=CacheHelper.getSecureString(CacheHelperKeys.token);
    options.headers['Authorization'] =
        'Bearer $token';
    options.headers['lang'] = 'en';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      //Todo logout
      //gotoLogin();
    }
    super.onError(err, handler);
  }
}
