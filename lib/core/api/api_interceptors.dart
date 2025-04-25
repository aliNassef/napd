import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1NSIsImVtYWlsIjoiYWRtaW4yM0BnbWFpbC5jb20iLCJqdGkiOiJmMDg1N2E0OC05Y2RiLTRkZTAtODAwOS1jNmE0NjM4MDEwMzQiLCJleHAiOjE3NDgxNDA3MzQsImlzcyI6Ik1hTWFDYXJlIiwiYXVkIjoiTWFNYUNhcmUifQ.Lj-0Tv1pXMfY6ozeugRdLMNxuI4pW4fx_COxre3U_rM';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = 'en';
    options.headers['Authorization'] = 'Bearer $token';
    options.headers['Cookie'] =
        '.AspNetCore.Identity.Application=CfDJ8F3x8xHNAZlJkwOKtBgJSWQCmNfY4m4Eo1xWcl6P3IZnkXYqoliH-Lq2u_GF3aBhuTFZWlsKOtkWmRSXZeM_bDrOjnN18vsPt_FVE_hQHsmRgX9ZMh_ngjD5gOOp9L16_5RwYA9dvlovDnfiABFYVQThgNR__U0gJSH1PY17G9kaMQddwp_Zzmv9UTkHi-_FR1_LgylDFZ5tyZ9d_4q_cdMhOR5WSMhnuz5rLNr2EU069tHyBF9bboO_4o77W-Id4Kwsio74IGyhlaAffcZW9nOE6G9wcneewMRg0ONqGvLVCE1G9GZ5XN8UGhkLlE0mOqf_raJH1dG00nsTDpMH9ou9f7liS5oBo4Qo5Fl12oAtNh3jn3REgQlykNxComP7c2cgwjFrKeFxtPByufDazqzbbJEDor141IKDSklyNBJErUqe9xpxpLarmXEh7orHWRPWSAqOlnAW8WlW_lz-7MY8ag4tzOGtqrj3kwtWgJjrT0e9En2GrvBeFg8nkX1BCGFgUaaIERZJTbKlDNgW-b660vLILbd7z4aw7FRyIf4O_gEeCAveaSIE0-0Ui-THK35-ryoDHKS9h6ARAWtqC6MesnidR_pqGDolFQmEVvyB7JtiJTDJfxWdIX8-TVxZ_CAxikqQipF_UBqfh1SdSSQcDdGqX2S2zLLMfUCuZugb';
    super.onRequest(options, handler);
  }
}
