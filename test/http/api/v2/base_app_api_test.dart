import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vendor_app/http/base_app_api.dart';
import 'package:vendor_app/http/client/app_client.dart';
import 'package:vendor_app/http/client/default_client.dart';
import 'package:vendor_app/http/fixture/sample/nil_success_fixture.dart';
import 'package:vendor_app/http/interceptor/mock_response_interceptor.dart';
import 'package:vendor_app/models/samples/article_model.dart';

class FakeApi extends BaseAppApi<ArticleModel> {
  @override
  String get path => '/api/v2/fake';

  @override
  DefaultClient defaultClient() => AppClient('https://www.test.com');

  @override
  ArticleModel? jsonToObject(Map<String, dynamic> json) {
    return ArticleModel.fromJson(json);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  group('BaseAppApi#fetchOne', () {
    test('it return header with app authorization after request', () async {
      MockResponseInterceptor interceptor = MockResponseInterceptor<NilSuccessFixture>(NilSuccessFixture());
      FakeApi fakeApi = FakeApi()..network.addInterceptor(interceptor);

      ArticleModel? result = await fakeApi.fetchOne(id: '1');
      Map<String, dynamic>? headers = fakeApi.response?.requestOptions.headers;

      expect(result == null, true);
      expect(headers?['authorization'], null); // 'Bearer FAKE-ACCESS-TOKEN-123'
      expect(headers?['X-Cm-App-Version'], '1.0.0');
      expect(headers?['X-Cm-Api-Version'], '1.0.0');
    });
  });
}
