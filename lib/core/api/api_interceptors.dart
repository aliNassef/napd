import 'package:dio/dio.dart';
import '../functions/get_user.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = 'en';

    if (getUser() != null) {
      options.headers['Authorization'] = 'Bearer ${getUser()!.token}';
    }

    super.onRequest(options, handler);
  }
}
