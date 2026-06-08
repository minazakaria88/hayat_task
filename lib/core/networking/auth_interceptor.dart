import 'package:dio/dio.dart';
import 'package:haya/core/routing/app_router.dart';
import 'package:haya/core/services/cache_helper.dart';
import 'package:haya/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:haya/injection.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)async {
    final token= await CacheHelper.getSecureString(CacheHelperKeys.token);
    options.headers['Authorization'] =
        'Bearer $token';
    options.headers['lang'] = 'en';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler)async {
    if (err.response?.statusCode == 401) {
      final authLocalDataSource=getIt<AuthLocalDataSource>();
      await authLocalDataSource.logout();
      router.goNamed(AppRouter.login.name);
    }
    super.onError(err, handler);
  }
}
