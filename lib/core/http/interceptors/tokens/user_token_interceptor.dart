import 'package:cm_vendor_app/core/http/interceptors/base_token_interceptor.dart';
import 'package:cm_vendor_app/core/models/token_model.dart';

// TODO: read token from user token
class UserTokenInterceptor extends BaseTokenInterceptor {
  @override
  Future<TokenModel?> getToken() async {
    // TokenModel? result = await UserTokenStorage().readObject();
    // return result;
    return null;
  }
}
