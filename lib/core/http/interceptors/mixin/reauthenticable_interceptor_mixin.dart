import 'package:dio/dio.dart';

mixin ReauthenticableInterceptorMixin on Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    int? statusCode = err.response?.statusCode;
    if (statusCode == 401) await reauthenticate(err.requestOptions);
    super.onError(err, handler);
  }

  Future<bool> reauthenticate(RequestOptions requestOptions);
}
