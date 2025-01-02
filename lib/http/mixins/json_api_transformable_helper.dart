part of 'json_api_transformable.dart';

class JsonApiTransformableHelper {
  JsonApiTransformableHelper._();

  static List<T>? buildItemsList<T extends BaseModel>(
    Map<String, dynamic> json,
    T? Function(Map<String, dynamic> json) jsonToObject,
  ) {
    dynamic items = json['data'];
    if (items is! List) return null;

    List<T> records = [];

    for (dynamic attrs in items) {
      T? record = jsonToObject(attrs);
      if (record != null) records.add(record);
    }

    return records;
  }

  static MetaModel? buildMetaModel(Map<String, dynamic> json) {
    dynamic meta = json['meta'];
    if (meta is Map<String, dynamic>) return MetaModel.fromJson(meta);
    return null;
  }

  static LinksModel? buildLinkModel(Map<String, dynamic> json) {
    dynamic links = json['links'];
    if (links is Map<String, dynamic>) return LinksModel.fromJson(links);
    return null;
  }
}
