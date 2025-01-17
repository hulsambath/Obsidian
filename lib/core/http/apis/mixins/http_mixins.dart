import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:logger/logger.dart';
import 'package:cm_vendor_app/core/helpers/app_helpers.dart';
import 'package:cm_vendor_app/core/http/clients/default_client.dart';

mixin HttpMixin {
  DefaultClient buildClient();

  DefaultClient? _client;
  DefaultClient get client => _client ??= buildClient();
  Dio get http => client.http;

  // Response already set in interceptor
  Response<dynamic>? get response {
    return client.defaultInterceptor.response;
  }

  int? get statusCode => response?.statusCode ?? dioError?.response?.statusCode;

  bool success() {
    bool? success = client.defaultInterceptor.success(response?.statusCode);
    return success == true;
  }

  Future<P?> runQueryExec<P>(Future<P?> Function() callback) async {
    try {
      _nonDioError = null;
      P? result = await callback();
      return result;
    } catch (e) {
      if (e is DioException) {
        Logger().e(
          error: e,
          stackTrace: e.stackTrace,
          {
            'realUri': e.response?.realUri.toString(),
            'scheme': e.response?.realUri.scheme,
            'host': e.response?.realUri.host,
            'queryParameters': e.response?.realUri.queryParameters,
            'data': e.response?.realUri.data,
            'method': e.response?.requestOptions.method,
            'statusMessage': e.response?.statusMessage,
            'responseData': e.response?.data,
          },
        );
      } else {
        _nonDioError = e;
        Logger().i('🚧🚧🚧 New error type found: ${e.runtimeType} (Let handle it here.)', error: e);
        Logger().e(errorMessage, error: e);
      }
    }
    return null;
  }

  void reset() {
    _nonDioError = null;
    client.defaultInterceptor.reset();
  }

  Object? _nonDioError;
  DioException? get dioError => client.defaultInterceptor.error;

  /// errors: {quantity: [must_remove_some_guests]}
  Map<dynamic, dynamic>? get errors => client.defaultInterceptor.errors;

  String? get errorMessage {
    if (dioError == null && _nonDioError != null) return null;
    return _serverErrorMessage ?? _dioErrorMessage;
  }

  String? get _serverErrorMessage {
    try {
      if (decodedServerError?['error'] != null) return decodedServerError?['error'];
      return null;
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic>? get decodedServerError {
    Response<dynamic>? response = dioError?.response;
    if (response == null) return null;
    return AppHelper.decodeRawResponse(response);
  }

  // TODO: add these key to en.json / km.json
  String? get _dioErrorMessage {
    switch (dioError?.type) {
      case DioExceptionType.badCertificate:
        return tr('enum.dio_error.bad_certificate');
      case DioExceptionType.badResponse:
        return tr('enum.dio_error.bad_response');
      case DioExceptionType.connectionTimeout:
        return tr('enum.dio_error.connection_timeout');
      case DioExceptionType.connectionError:
        return tr('enum.dio_error.connection_error');
      case DioExceptionType.receiveTimeout:
        return tr('enum.dio_error.receive_timeout');
      case DioExceptionType.cancel:
        return tr('enum.dio_error.cancel');
      case DioExceptionType.sendTimeout:
        return tr('enum.dio_error.send_timeout');
      case DioExceptionType.unknown:
        return tr('enum.dio_error.unknown');
      default:
        return null;
    }
  }

  String? get rawErrorMessage {
    if (dioError == null && _nonDioError != null) {
      return _nonDioError.toString();
    }

    Response<dynamic>? response = dioError?.response;
    if (response == null) return dioError?.message;
    try {
      Map<String, dynamic>? data = AppHelper.decodeRawResponse(response);
      return data.toString();
    } catch (e) {
      return response.statusMessage;
    }
  }
}
