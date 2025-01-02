import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:vendor_app/helpers/app_helpers.dart';
import 'package:vendor_app/http/client/default_client.dart';

mixin HttpMixin {
  DefaultClient defaultClient();

  DefaultClient? _network;
  DefaultClient get network => _network ??= defaultClient();
  Dio get http => network.http;

  // Response already set in interceptor
  Response<dynamic>? get response {
    return _network?.defaultInterceptor.response;
  }

  int? get statusCode => response?.statusCode ?? dioError?.response?.statusCode;

  bool success() {
    bool? success = _network?.defaultInterceptor.success(response?.statusCode);
    return success == true;
  }

  Future<P?> runQueryExec<P>(Future<P?> Function() callback) async {
    try {
      _nonDioError = null;
      P? result = await callback();
      return result;
    } catch (e) {
      _nonDioError = e;
      Logger().e(e, error: e);
    }
    return null;
  }

  Object? _nonDioError;
  DioException? get dioError => _network?.defaultInterceptor.error;

  Map<dynamic, dynamic>? get errors => _network?.defaultInterceptor.errors;

  String? get errorMessage {
    if (dioError == null && _nonDioError != null) {
      return _nonDioError.toString();
    }

    Response<dynamic>? response = dioError?.response;
    if (response == null) return dioError?.message;
    try {
      Map<String, dynamic>? data = AppHelper.decodeRawResponse(response);
      return data?['error'];
    } catch (e) {
      return response.statusMessage;
    }
  }
}
