import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:vendor_app/constants/app_constants.dart';
import 'package:vendor_app/helpers/app_helpers.dart';
import 'package:vendor_app/http/client/default_client.dart';
import 'package:vendor_app/http/mixins/http_mixins.dart';
import 'package:vendor_app/models/token_model.dart';

abstract class BaseAuthenticator with HttpMixin {
  String get path => 'spree_oauth/token';
  Logger log = Logger();

  @override
  DefaultClient defaultClient() {
    return DefaultClient(AppConstants.appUrl);
  }

  // To be overrided
  Future<TokenModel?> requestToken(Map<String, dynamic>? params);

  // To be executed
  Future<void> exec({
    Map<String, dynamic>? params,
  }) async {
    TokenModel? token = await runQueryExec(() => requestToken(params));
    log.i(token?.accessToken);
    // if (success() && token?.accessToken != null) await storage.writeObject(token);
  }

  TokenModel? decodeResponse(Response response) {
    Map<String, dynamic> json = AppHelper.decodeRawResponse(response)!;
    return TokenModel.fromJson(json);
  }
}
