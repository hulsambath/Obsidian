import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vendor_app/helpers/app_helpers.dart';
import 'package:vendor_app/http/client/app_client.dart';
import 'package:vendor_app/http/client/default_client.dart';
import 'package:vendor_app/http/fixture/spree_oauth/app_token_error_fixture.dart';
import 'package:vendor_app/http/fixture/spree_oauth/app_token_success_fixture.dart';
import 'package:vendor_app/http/interceptor/mock_response_interceptor.dart';
import 'package:vendor_app/http/spree_auth/base_authenticator.dart';
import 'package:vendor_app/models/base_model.dart';
import 'package:vendor_app/models/token_model.dart';

class AppAuthenticatorTest extends BaseAuthenticator {
  @override
  String get path => '/spree_oauth/token';

  @override
  DefaultClient defaultClient() => AppClient('https://example.com');

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

void main() async {
  group('AppAuthenticator#exec', () {
    test('it successfully requested token', () async {
      AppAuthenticatorTest api = AppAuthenticatorTest();
      api.network.addInterceptor(
        MockResponseInterceptor(
          AppTokenSuccessFixture(),
          baseUrl: null,
        ),
      );

      await api.exec();

      expect(api.response?.realUri.toString(),
          'https://example.com/spree_oauth/token?grant_type=client_credentials&client_secret=clientSecret&client_id=clientId');

      expect(api.success(), true);
    });

    test('it requested error and does not have token in storage', () async {
      AppAuthenticatorTest api = AppAuthenticatorTest();
      api.network.addInterceptor(
        MockResponseInterceptor(
          AppTokenErrorFixture(),
          baseUrl: 'https://example.com',
        ),
      );

      await api.exec();

      expect(api.success(), false);
      expect(api.errorMessage, 'invalid_request');
      expect(api.dioError?.response?.statusCode, 400);
      expect(api.dioError?.response?.realUri.toString(),
          'https://example.com/spree_oauth/token?grant_type=client_credentials&client_secret=clientSecret&client_id=clientId');
    });
  });
}
