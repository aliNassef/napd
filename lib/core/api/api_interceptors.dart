import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyNyIsImVtYWlsIjoiYWRtaW4zQGdtYWlsLmNvbSIsImp0aSI6ImVlYmNiMTc2LTk2MjMtNGVjNC1iMzk1LTg3M2M5NDE0OTE1MCIsImV4cCI6MTc0NTIyOTEwMSwiaXNzIjoiTWFNYUNhcmUiLCJhdWQiOiJNYU1hQ2FyZSJ9.3T6HjYhIUF7Lfsec0jRcS-xp99VrlS-J4dmyXgty7dw';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = 'en';
    options.headers['Authorization'] = 'Bearer $token';
    options.headers['Cookie'] =
        '.AspNetCore.Identity.Application=CfDJ8Hx42j6jl99Fvh9HZkUSh9AK2WhLyxTjzAHy_hHGPS02v03E0jtXe9LqyV_7lADwhdg8m3ni9bUPn2qsBEnBg8cLeSfdAQUG8yT4M1zuZ6yUmBiuo3545l3iksVs0GnhZUZqiSxJYjViZpQ_Z1_O8Dk_aBSkiZfltxS2z32liGDHk5pxoNd2LiO2YarWOKRXLxoYwHMuVgTO7SgZ-crW4lQ_Wo19SVIx8gRzhi9SfL01GLYHA65UxMC_j24yqJBMP6UxZCeNiuZiUwZzIzcilhRb4CPyVzGlofvt5noZpY6fNJcNcE5Ayp-ZVGkIOcNpftYo9RFOvU9cpbnyoTctQecvioprkDEM7JlmDd128HmNh66u6yp-NKeZ2HsNTYmmdyph6rzdYLIECas4yoRKR8h93b3KLkvZQ5YKzvvtZg-4oyhv3hUR71oRiJT3Ex9Hm4wD3_epxE0McZS7w7is111IbBT9zsMaIbyrAgcziZcByaCkax1TM8Y19ypm2ZAZ4Jf-WCCmN0wnXUABItjT6yPw5d-LrxcmRT-4E87q9Js124Gn2BDDzt2vtLa3Cj1LoTxe8VMqcai2kDN4EDTAqrismSxrZGiw3pRwqiJR8I-zmV_4umFlc0udnUAv7ysG7w9doL-JtlzQdz4SfP-7APIo2DIb5DO-K2r-3rg2W4T8vMsy5nC45Fz7k1axaQkeNw';
    super.onRequest(options, handler);
  }
}
