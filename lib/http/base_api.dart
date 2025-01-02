import 'package:dio/dio.dart';
import 'package:vendor_app/helpers/app_helpers.dart';
import 'package:vendor_app/http/mixins/endpoint_constructor.dart';
import 'package:vendor_app/http/mixins/http_mixins.dart';
import 'package:vendor_app/http/mixins/json_api_transformable.dart';
import 'package:vendor_app/models/base_model.dart';
import 'package:vendor_app/models/object_list_model.dart';

enum HttpMethod {
  post,
  put,
  patch;

  String get action => name.toUpperCase();
}

abstract class BaseApi<T extends BaseModel> with JsonApiTransformable<T>, EndpointConstructor, HttpMixin {
  Map<String, dynamic> get defaultQueryParameters => {};

  Future<ObjectListModel<T>?> fetchAll({
    Map<String, dynamic>? queryParameters,
  }) async {
    return runQueryExec<ObjectListModel<T>>(() async {
      queryParameters = await mergeParams(queryParameters);
      String endpoint = fetchAllUrl();

      Response response = await http.get(
        endpoint,
        queryParameters: queryParameters,
      );

      return responseToObjectList(response);
    });
  }

  Future<T?> fetchOne({
    String? id,
    bool collection = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    return runQueryExec<T>(() async {
      queryParameters = await mergeParams(queryParameters);
      String endpoint = fetchOneUrl(id: id, collection: collection);

      Response response = await http.get(
        endpoint,
        queryParameters: queryParameters,
      );

      return responseToObject(response);
    });
  }

  Future<T?> create({
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return runQueryExec<T>(() async {
      queryParameters = await mergeParams(queryParameters);
      String endpoint = createUrl();

      Response? response = await http.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );

      return responseToObject(response);
    });
  }

  Future<T?> update({
    String? id,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool collection = true,
    HttpMethod? method,
  }) async {
    return runQueryExec<T>(() async {
      if (method != null) assert(method == HttpMethod.patch || method == HttpMethod.put);

      method ??= data?.isNotEmpty == true ? HttpMethod.put : HttpMethod.patch;
      queryParameters = await mergeParams(queryParameters);

      String endpoint = updatelUrl(id: id, collection: collection);
      Response? response;

      if (method == HttpMethod.put) {
        response = await http.put(
          endpoint,
          data: data,
          queryParameters: queryParameters,
        );
      }

      if (method == HttpMethod.patch) {
        response = await http.patch(
          endpoint,
          queryParameters: queryParameters,
        );
      }

      if (response == null) return null;
      return responseToObject(response);
    });
  }

  /// - 200 Success: Returns object
  /// - 204 Success: No Content
  Future<T?> delete({
    String? id,
    Map<String, dynamic>? queryParameters,
    bool collection = true,
  }) async {
    return runQueryExec<T>(() async {
      queryParameters = await mergeParams(queryParameters);
      String endpoint = deletelUrl(id: id, collection: collection);

      Response? response = await http.delete(
        endpoint,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        return responseToObject(response);
      }

      return null;
    });
  }

  Future<Map<String, dynamic>> mergeParams(Map<String, dynamic>? params) async {
    params ??= {};
    params.putIfAbsent('locale', () => AppHelper.getCurrentLocale());

    for (final defaultParam in defaultQueryParameters.entries) {
      params.putIfAbsent(defaultParam.key, () => defaultParam.value);
    }

    return params;
  }
}
