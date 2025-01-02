import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vendor_app/http/client/app_client.dart';
import 'package:vendor_app/http/client/default_client.dart';
import 'package:vendor_app/http/fixture/spree_oauth/user_token_error_fixture.dart';
import 'package:vendor_app/http/fixture/spree_oauth/user_token_success_fixture.dart';
import 'package:vendor_app/http/interceptor/mock_response_interceptor.dart';
import 'package:vendor_app/http/spree_auth/base_authenticator.dart';
import 'package:vendor_app/models/token_model.dart';

class UsernamePasswordAuthenticationTest extends BaseAuthenticator {
  @override
  String get path => '/spree_oauth/token';

  @override
  DefaultClient defaultClient() => AppClient('https://example.com');

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

void main() async {
  group('UsernamePasswordAuthenticator#exec', () {
    test('it successfully requested and store token to storage', () async {
      UsernamePasswordAuthenticationTest api = UsernamePasswordAuthenticationTest();

      api.network.addInterceptor(
        MockResponseInterceptor(
          UserTokenSuccessFixture(),
          baseUrl: 'https://example.com',
        ),
      );

      await api.exec(params: {
        'username': 'abc@gmail.com',
        'password': '1234567',
      });

      expect(api.response?.realUri.toString(),
          'https://example.com/spree_oauth/token?grant_type=password&username=abc%40gmail.com&password=1234567');
      expect(api.success(), true);
    });

    test('it requested error and does not have token in storage', () async {
      UsernamePasswordAuthenticationTest api = UsernamePasswordAuthenticationTest();

      api.network.addInterceptor(
        MockResponseInterceptor(
          UserTokenErrorFixture(),
          baseUrl: 'https://example.com',
        ),
      );

      await api.exec(params: {
        'username': 'abc@gmail.com',
        'password': '1234567',
      });

      expect(api.success(), false);
      expect(api.errorMessage, 'invalid_request');
      expect(api.dioError?.response?.statusCode, 400);
      expect(api.dioError?.response?.realUri.toString(),
          'https://example.com/spree_oauth/token?grant_type=password&username=abc%40gmail.com&password=1234567');
    });
  });
}
