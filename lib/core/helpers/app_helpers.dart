import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cm_vendor_app/global.dart';

class AppHelper {
  static String? queryParameters({
    required String url,
    required String param,
  }) {
    return Uri.parse(url).queryParameters[param];
  }

  static Map<String, dynamic>? decodeRawResponse(Response<dynamic> response) {
    dynamic json = response.data;
    if (json is Map<String, dynamic>) return json;
    if (json is String) {
      try {
        json = jsonDecode(json);
        return json;
      } catch (e) {
        throw 'decodeResponse(): $e';
      }
    }
    return null;
  }

  static String getCurrentLocale() {
    if (Global.instance.unitTesting) return 'en';
    return Intl.getCurrentLocale();
  }
}
