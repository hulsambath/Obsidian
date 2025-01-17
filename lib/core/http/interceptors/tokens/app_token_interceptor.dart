import 'package:cm_vendor_app/core/http/interceptors/base_token_interceptor.dart';
import 'package:cm_vendor_app/core/models/token_model.dart';

// TODO: read token from app token
class AppTokenInterceptor extends BaseTokenInterceptor {
  @override
  Future<TokenModel?> getToken() async {
    // TokenModel? result = await AppTokenStorage().readObject();
    // return result;
    return null;
  }
}
