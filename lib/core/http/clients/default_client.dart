import 'package:cm_vendor_app/core/http/clients/base_client.dart';
import 'package:cm_vendor_app/core/http/interceptors/default_interceptor.dart';

class DefaultClient extends BaseClient {
  late final DefaultInterceptor defaultInterceptor;

  DefaultClient(String baseUrl) {
    _addDefaultInterceptor(baseUrl);
  }

  void _addDefaultInterceptor(String baseUrl) {
    defaultInterceptor = DefaultInterceptor(baseUrl: baseUrl);
    addInterceptor(defaultInterceptor);
  }
}
