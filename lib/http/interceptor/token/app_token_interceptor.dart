import 'package:vendor_app/http/interceptor/base_token_interceptor.dart';
import 'package:vendor_app/models/token_model.dart';

class AppTokenInterceptor extends BaseTokenInterceptor {
  @override
  Future<TokenModel?> getToken() async {
    TokenModel? result;
    return result;
  }
}
