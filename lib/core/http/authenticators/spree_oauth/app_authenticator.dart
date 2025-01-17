import 'package:dio/dio.dart';
import 'package:cm_vendor_app/constants/api_constants.dart';
import 'package:cm_vendor_app/core/helpers/app_helpers.dart';
import 'package:cm_vendor_app/core/http/authenticators/base_authenticator.dart';
import 'package:cm_vendor_app/core/models/token_model.dart';

import 'package:cm_vendor_app/core/models/base_model.dart';

class AppAuthenticator extends BaseAuthenticator {
  @override
  String get path => 'spree_oauth/token';

  @override
  Future<TokenModel?> requestToken(Map<String, dynamic>? params) async {
    Map<String, dynamic> data = filterOutNull({
      'grant_type': 'client_credentials',
      'client_secret': ApiConstant.clientSecret.trim().isNotEmpty ? ApiConstant.clientSecret : null,
      'client_id': ApiConstant.clientId.trim().isNotEmpty ? ApiConstant.clientId : null,
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
