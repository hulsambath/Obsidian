import 'package:dio/dio.dart';
import 'package:vendor_app/http/interceptor/token/app_token_interceptor.dart';
import 'package:vendor_app/http/spree_auth/reauth/app_reauthenticator.dart';

import 'default_client.dart';

class AppClient extends DefaultClient {
  AppClient(super.baseUrl) {
    addInterceptor(AppTokenInterceptor());
    addInterceptor(AppReauthenticateInterceptor());
    addInterceptor(retryInterceptor());
  }

  InterceptorsWrapper retryInterceptor() {
    return InterceptorsWrapper(
      onError: (DioException err, ErrorInterceptorHandler handler) async {
        if (err.response?.statusCode == 401) {
          Map<String, dynamic> headers = await AppTokenInterceptor().getHeaders(err.requestOptions.headers);
          Response response = await super.http.fetch(err.requestOptions.copyWith(headers: headers));
          return handler.resolve(response);
        }
        handler.next(err);
      },
    );
  }
}
