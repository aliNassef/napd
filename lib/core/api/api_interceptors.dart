import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyNyIsImVtYWlsIjoiYWRtaW4zQGdtYWlsLmNvbSIsImp0aSI6IjcwZDdkMzc2LTgyMzgtNDg4Yy1iNDNiLTUwZTdlMjE5OGNlYiIsImV4cCI6MTc0ODIwOTk4MCwiaXNzIjoiTWFNYUNhcmUiLCJhdWQiOiJNYU1hQ2FyZSJ9.hsedFlfKJM8tvZCrd_YJi8WJYFPsRRELfqHr4iF7pZc';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = 'en';
    options.headers['Authorization'] = 'Bearer $token';
    options.headers['Cookie'] =
        '.AspNetCore.Identity.Application=CfDJ8PU5VfM535BIhq1n8Ghf5tBUkaJwX48m_UEwEAw4K-6TJCdy098a0CujSJcdNwCkYGlIiN6479wDiLKsDq_MHQDvLru0t0gPhTXkrcA3cmGA-JKxyre4LW6jflhnXXzcTwPhPVVL1EcUZBj_WLLHXosOObcffQngqNovBcNp3ELBrpkf-CF27AJV-Mmqe4TCvBrH_rLkWLT4SNDIBGRZQQFT3damNwGPaRwH7-1wHhmugRJ-ShPWitpKobrCoz0ehhpylTso8gJIakJqS7BxwQ_fjSwu6UBDgceiWYNcJnjWbiQL-bRqLFmDD5i3ynXrvVN720SUj5laoTfWBjbUFtZCJ84W5wUN0lh6kIJLCG7m7r8rqoBIEmCzY1d1D8pecjgqLgrynThm2faaqTVeplcrijv5jFqEYx16bMTh_MiIRPnyB_GJk4y3NF2l4CHmSZhvWkbtzWivSS288e88W5ZPAxvROvnl6_FciOAATfmeR69RE2FIJq_zsBjwGR6e5-3T7Q4icoHxQ94IAm4s4UkE2-WKB5BTDrENZlXmugonyXQhpkCR3eTqJdVvOQDpu8GSyZDC6CDb-RRgrZJ7EtggdgFLf4M__akvYrvVeyUabXY5kf4hgfFR5v7xNaeTlqk7NwgGBjcNzmecC1uUtkFP7X2X2BTRUKVIpnzhZqqQfAxw9SMAPD8IHhC_UHMr0Q';
    super.onRequest(options, handler);
  }
}
