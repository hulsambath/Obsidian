import 'package:dio/dio.dart';
import 'package:vendor_app/constants/platform_checker.dart';

class DefaultInterceptor extends InterceptorsWrapper {
  final String baseUrl;

  Response? _response;
  DioException? _error;
  RequestOptions? _requestOptions;

  Response? get response => _response;
  DioException? get error => _error;
  RequestOptions? get requestOptions => _requestOptions;

  /// {
  ///   error: Quantity must_remove_some_guests,
  ///   errors: {quantity: [must_remove_some_guests]}
  /// }
  Map? get errors {
    final data = error?.response?.data;
    final quantityErrors = data is Map && data['errors'] is Map ? data['errors'] : null;
    if (quantityErrors is Map) return quantityErrors;
    return null;
  }

  DefaultInterceptor({
    required this.baseUrl,
  }) : assert(!baseUrl.endsWith('/'));

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _response = response;
    if (success(response.statusCode)) {
      return super.onResponse(response, handler);
    } else {
      DioException error = DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
      );
      return handler.reject(error, true);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _error = err;
    super.onError(err, handler);
  }

  String? get xAppPlatform {
    if (kIsIOS) {
      return 'IOS';
    } else if (kIsAndroid) {
      return 'Android';
    }
    return null;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.baseUrl = baseUrl;

    Map<String, dynamic> headers = options.headers;
    headers['X-Cm-Api-Version'] = '1.0.0';
    headers['X-Cm-App-BuildSignature'] = '';
    headers['X-Cm-App-Version'] = '1.0.0';
    headers['X-Cm-App-Name'] = 'unit-test';
    headers['X-Cm-OperatingSystem'] = 'unit-os';
    headers['X-Cm-App-Platform'] = xAppPlatform;
    options.headers = headers;

    _error = null;
    _response = null;
    _requestOptions = options;

    return super.onRequest(options, handler);
  }

  bool success(int? statusCode) {
    int? status = statusCode;
    if (status != null) return status >= 200 && status < 300;
    return false;
  }
}
