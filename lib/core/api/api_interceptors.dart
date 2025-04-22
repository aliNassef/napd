import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyNCIsImVtYWlsIjoic2hhaGQyMEBnbWFpbC5jb20iLCJqdGkiOiI1ZDEyNTkxYy1kZGViLTRhNmUtOWNjNi0yMDBkNTk2MWExNWQiLCJleHAiOjE3NDI3MTUzMDQsImlzcyI6Ik1hTWFDYXJlIiwiYXVkIjoiTWFNYUNhcmUifQ.E6DYbCGg4c4NaQp6dgJG7rAawTwNGQ0HRp9CuycQcEo';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = 'en';
    options.headers['Authorization'] = 'Bearer $token';
    options.headers['Cookie'] =
        '.AspNetCore.Identity.Application=CfDJ8LEEK0Zxd51EvU7rA1Uo1wJN8n5uhYD94q2Es-FF-GbpXAnZHmYI0rlTJDnPbQ3NKUnqcEd7MbSRdxi7nXLMru8xMJ5Xuef6y-V8QKFGmv5Tf3EX_6OUF2wroKDLvm7KI0TyiEfztE_K7-9H-CiM6iCP5Gl5OJpRZOYAVi383WHKWI-0OJy9OtOBXl1nL4zM8sXX7LZQjhgWBgeMbvRc3SFaDbom9RD3stOVx_UY9uHeWvjrWqTSMgs8CU5ZHFm8JwzI4HiOlx1hedZlk484lADvTkOYipZcoIirhErkyn9bIpmpu4M2M5C_w1894l0fV9Vgim0ZJexpRoget-46yqVawKbcbHUxAoJbIf-6_54hKx_ih_OajMB82ujs2FjTbm0sMr98Ms82GmTQ9OpxrmJp3p6-gMmEKWMKRM_7IdmMZrPV-tbHkufBqH-m7awWSWMTQsUWDQnZrGIqNQPrkT6LTOc2KMIBA2E_8HAA0i533zpd36qXQPXVnVXRTKuQxYFqzYg95yz1R_RicIKWqby5ekt9uqxvoHMjaPcgIIGG3Dj5wnW0sq8XKeP9arewES-slUPSBcw_FBrDzg-1nBIto3VPhosncgEbo_AG-btoPPxCBca_gK8irybzlrZ5lD7jayVbACAJmw6gVAknnl2MKmoyfTpUbLrvv7OKCW8apC1iVoEIKGTgZrYsU7WBYg';
    super.onRequest(options, handler);
  }
}
