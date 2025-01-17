import 'package:cm_vendor_app/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:cm_vendor_app/core/helpers/app_helpers.dart';
import 'package:cm_vendor_app/core/http/clients/default_client.dart';
import 'package:cm_vendor_app/core/http/apis/mixins/http_mixins.dart';
import 'package:cm_vendor_app/core/models/token_model.dart';

abstract class BaseAuthenticator with HttpMixin {
  String get path => 'spree_oauth/token';
  Logger logger = Logger();

  @override
  DefaultClient buildClient() {
    return DefaultClient(ApiConstant.apiUrl);
  }

  // To be overrided
  Future<TokenModel?> requestToken(Map<String, dynamic>? params);

  // TODO: make a token storage & save user token (check BookMe+ for sample)
  // To be executed
  Future<void> exec({
    Map<String, dynamic>? params,
  }) async {
    // TokenModel? token = await runQueryExec(() => requestToken(params));
    // if (success() && token?.accessToken != null) await storage.writeObject(token);
  }

  TokenModel? decodeResponse(Response response) {
    Map<String, dynamic> json = AppHelper.decodeRawResponse(response)!;
    return TokenModel.fromJson(json);
  }
}
