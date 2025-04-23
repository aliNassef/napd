import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyNyIsImVtYWlsIjoiYWRtaW4zQGdtYWlsLmNvbSIsImp0aSI6IjUxYjVjMThiLWQ2NDUtNDQyMC04MjM2LTVlMGVmMDkwNTk1YSIsImV4cCI6MTc0Nzk4NzM2NiwiaXNzIjoiTWFNYUNhcmUiLCJhdWQiOiJNYU1hQ2FyZSJ9.vFBq0eQEYLSCZ_lKvEr-a1vqJQ3KLLj2cZkRFGCCDkA';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = 'en';
    options.headers['Authorization'] = 'Bearer $token';
    options.headers['Cookie'] =
        '.AspNetCore.Identity.Application=CfDJ8CV4xyim-iFOq2DLrj6LmfEk-DWXa4hAsDetqUKGfAKAzLW6BVZ5VUPBYGVldqp83fpgiqfhPsGImFF8iT3CFTI8cRAm7An2NQGS-8LyjtGNiDNfSkZr9uDJ-Z9Z9r21pMwkAAr4ZfhaqdEKhyzGQEOztTJBMOAD3F-n1kIpkmeEDSQBk8flOHjFOnSA4eu6EZkJIUuPGLrTSgUTfcXdsiXQwi1Jl5PzhxTip2_P-gPAuAo67SMQVYeSqndEtZu8lSTHoOFksGzvZ30TEm2qZBb8Bn61bFl_ahMvqB52dIaGG4G9oOcq-W1v4zVm4VeUrBHWN343X-ZXjbW9BieXVQnfU5571ciPf81dJrCJar80Bp30LbU6dmYyYpN-wWW6qgZyVn0d8iS6oEOeouqmztBp4Lz79dBgY4jCwWoORKr3rpAcyk5SluTLRQ1fIeziP91aArlA-zUDnobTedKc4H5aKqGxKdFESNB2p2C5cPLvhr8Eiu0GQprFPtt4vKxDWQ03W2IHUW38-CJHrnFcZdQtACaf3WuMyapzYhA-Il1vYFR6oZhxZBpZBukVE7t_HMb5KUS4pfS_jJ3qKXzyw3ZljT-u4_2__-RSnS8q6NG8gYSeZMmmuQDRM-JARYBFnS6BYLjlc3pFx8nacOv61N3DLd5R7WaQ87V4lFyvh2Q8cmST3SEM3WsixCB-YY_TIg';
    super.onRequest(options, handler);
  }
}
