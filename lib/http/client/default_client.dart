import 'package:vendor_app/http/client/base_client.dart';
import 'package:vendor_app/http/interceptor/default_interceptor.dart';

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
