import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer ';
    options.headers['lang'] = 'en';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // gotoLogin() {
    //   CacheHelper.clearData();
    //   NavigatorClass.navigatorKey.currentState!.pushNamedAndRemoveUntil(
    //     Routes.login,
    //     (context) => false,
    //   );
    // }

    if (err.response?.statusCode == 401) {
      //Todo logout
      //gotoLogin();
    }
    super.onError(err, handler);
  }
}
