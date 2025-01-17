import 'package:dio/dio.dart';
import 'package:cm_vendor_app/core/http/authenticators/base_authenticator.dart';
import 'package:cm_vendor_app/core/models/token_model.dart';

class UsernamePasswordAuthenticator extends BaseAuthenticator {
  @override
  String get path => 'spree_oauth/token';

  @override
  Future<TokenModel?> requestToken(Map<String, dynamic>? params) async {
    assert(params?['username'] != null);
    assert(params?['password'] != null);

    String username = params!['username'];
    String password = params['password'];

    Map<String, dynamic> data = {
      'grant_type': 'password',
      'username': username,
      'password': password,
    };

    Response response = await http.post(path, queryParameters: data);
    if (success()) {
      return decodeResponse(response);
    } else {
      return null;
    }
  }
}
