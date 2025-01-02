import 'package:dio/dio.dart';
import 'package:vendor_app/http/fixture/base_fixture.dart';

class MockResponseInterceptor<T extends BaseFixture> extends InterceptorsWrapper {
  final T fixture;
  final String? baseUrl;

  MockResponseInterceptor(
    this.fixture, {
    this.baseUrl,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (baseUrl != null) options.baseUrl = '$baseUrl/';
    Response<dynamic> response = fixture.response(options);
    return handler.resolve(response, true);
  }
}
