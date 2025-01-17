import 'package:dio/dio.dart';

abstract class BaseClient {
  final Dio http = Dio();

  void addInterceptor(Interceptor interceptor) {
    http.interceptors.add(interceptor);
  }

  void removeInterceptor(Interceptor interceptor) {
    http.interceptors.removeWhere((i) => i == interceptor);
  }
}
