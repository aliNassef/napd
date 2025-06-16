import 'package:dio/dio.dart';
import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/core/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = 'en';
    options.headers['Content-Type'] = 'application/json';
    if (CacheHelper().getData(key: ApiKey.token) != null) {
      options.headers['Authorization'] =
          'Bearer ${CacheHelper().getData(key: ApiKey.token)}';
    }

    super.onRequest(options, handler);
  }
}
