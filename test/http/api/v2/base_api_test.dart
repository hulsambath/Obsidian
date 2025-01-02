import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vendor_app/http/base_api.dart';
import 'package:vendor_app/http/client/app_client.dart';
import 'package:vendor_app/http/client/default_client.dart';
import 'package:vendor_app/http/fixture/sample/sample_get_article_fixture.dart';
import 'package:vendor_app/http/fixture/sample/sample_get_articles_fixture.dart';
import 'package:vendor_app/http/interceptor/mock_response_interceptor.dart';
import 'package:vendor_app/models/object_list_model.dart';
import 'package:vendor_app/models/samples/article_model.dart';

class ArticleApi extends BaseApi<ArticleModel> {
  @override
  String get path => '/api/v2/articles';

  @override
  DefaultClient defaultClient() => AppClient('https://www.test.com');

  @override
  ArticleModel? jsonToObject(Map<String, dynamic> json) {
    return ArticleModel.fromJson(json);
  }
}

void main() async {
  group('BaseApi#fetchAll', () {
    test('it successfully return transformed object list', () async {
      InterceptorsWrapper interceptor = MockResponseInterceptor(SampleGetArticlesFixture());
      ArticleApi api = ArticleApi()..network.addInterceptor(interceptor);

      ObjectListModel<ArticleModel>? result = await api.fetchAll(
        queryParameters: {'include': 'authur'},
      );

      expect(result!.items.length, 1);
      expect(result.items[0].id, '1');
      expect(result.items[0].author?.name, 'John');

      expect(api.response?.realUri.query, 'include=authur&locale=en');
      expect(api.response?.realUri.pathSegments.last, 'articles');
      expect(
        api.response?.realUri.toString(),
        'https://www.test.com/api/v2/articles?include=authur&locale=en',
      );
    });
  });

  group('BaseApi#fetchOne', () {
    test('it successfully return transformed single object', () async {
      InterceptorsWrapper interceptor = MockResponseInterceptor(SampleGetArticleFixture());
      ArticleApi api = ArticleApi()..network.addInterceptor(interceptor);

      ArticleModel? result = await api.fetchOne(
        id: '12345678',
        queryParameters: {'include': 'authur'},
      );

      expect(result?.title, 'JSON API paints my bikeshed!');
      expect(result?.author?.age, 80);
      expect(result?.author?.gender, 'male');

      expect(api.response?.realUri.pathSegments.last, '12345678');
      expect(api.response?.realUri.query, 'include=authur&locale=en');
      expect(
        api.response?.realUri.toString(),
        'https://www.test.com/api/v2/articles/12345678?include=authur&locale=en',
      );
    });
  });
}
