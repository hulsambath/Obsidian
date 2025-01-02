import 'package:dio/dio.dart';
import 'package:japx/japx.dart';
import 'package:vendor_app/helpers/app_helpers.dart';
import 'package:vendor_app/models/base_model.dart';
import 'package:vendor_app/models/links_model.dart';
import 'package:vendor_app/models/meta_model.dart';
import 'package:vendor_app/models/object_list_model.dart';

part 'json_api_transformable_helper.dart';

mixin JsonApiTransformable<T extends BaseModel> {
  T? jsonToObject(Map<String, dynamic> json);

  ObjectListModel<T> jsonToObjectList(Map<String, dynamic> json) {
    return ObjectListModel<T>.fromJson(json, jsonToObject);
  }

  Future<T?> responseToObject(Response<dynamic> response) async {
    Map<String, dynamic>? json = decodeResponse(response, 'data');
    if (json == null) return null;

    return jsonToObject(json);
  }

  Future<ObjectListModel<T>?> responseToObjectList(Response<dynamic> response) async {
    Map<String, dynamic>? json = decodeResponse(response);
    if (json == null) return null;

    return jsonToObjectList(json);
  }

  // If response is not JSON:API, return null as it not follow format.
  Map<String, dynamic> decodeJson(Map<String, dynamic> json) {
    Map<String, dynamic> data = json.containsKey('data') && json['data'] != null ? Japx.decode(json) : {};
    return data;
  }

  Map<String, dynamic>? decodeResponse(Response<dynamic> response, [String? key]) {
    Map<String, dynamic>? json = AppHelper.decodeRawResponse(response);

    if (json?.isNotEmpty == true) {
      json = decodeJson(json!);
      return key != null ? json[key] : json;
    }

    return null;
  }
}
