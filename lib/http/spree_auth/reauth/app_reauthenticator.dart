import 'package:dio/dio.dart';
import 'package:vendor_app/http/spree_auth/token/app_authenticator.dart';

import '../mixin/reauthenticable_interceptor_mixin.dart';

class AppReauthenticateInterceptor extends InterceptorsWrapper with ReauthenticableInterceptorMixin {
  @override
  Future<bool> reauthenticate(RequestOptions requestOptions) async {
    final AppAuthenticator authenticator = AppAuthenticator();
    await authenticator.exec();
    return authenticator.success();
  }
}
