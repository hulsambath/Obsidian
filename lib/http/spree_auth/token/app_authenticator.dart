import 'package:dio/dio.dart';
import 'package:vendor_app/helpers/app_helpers.dart';
import 'package:vendor_app/http/spree_auth/base_authenticator.dart';
import 'package:vendor_app/models/token_model.dart';

import '../../../models/base_model.dart';

class AppAuthenticator extends BaseAuthenticator {
  @override
  String get path => 'spree_oauth/token';

  @override
  Future<TokenModel?> requestToken(Map<String, dynamic>? params) async {
    Map<String, dynamic> data = filterOutNull({
      'grant_type': 'client_credentials',
      'client_secret': 'clientSecret',
      'client_id': 'clientId',
    });

    Response<dynamic> response = await http.post(path, queryParameters: data);
    if (success()) {
      Map<String, dynamic> json = AppHelper.decodeRawResponse(response)!;
      return TokenModel.fromJson(json);
    } else {
      return null;
    }
  }
}
