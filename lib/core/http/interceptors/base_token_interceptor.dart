import 'package:dio/dio.dart';
import 'package:cm_vendor_app/core/models/token_model.dart';

abstract class BaseTokenInterceptor<T extends TokenModel> extends InterceptorsWrapper {
  BaseTokenInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    await constructRequest(options, handler);
    return super.onRequest(options, handler);
  }

  Future<void> constructRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = await getHeaders(options.headers);
  }

  Future<Map<String, dynamic>> getHeaders(Map<String, dynamic> headers) async {
    TokenModel? token = await getToken();
    headers['authorization'] = token?.authorization;
    return headers;
  }

  Future<bool> matchToken(String compareAauthorization) async {
    String? authorization = await getHeaders({}).then((value) => value['authorization']);
    return compareAauthorization == authorization;
  }

  Future<TokenModel?> getToken();
}
