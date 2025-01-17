import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:cm_vendor_app/core/http/apis/mixins/json_api_transformable.dart';
import 'package:cm_vendor_app/core/models/base_model.dart';
import 'package:cm_vendor_app/core/models/links_model.dart';
import 'package:cm_vendor_app/core/models/meta_model.dart';

part 'object_list_model.g.dart';

@CopyWith()
class ObjectListModel<T extends BaseModel> {
  final List<T> items;
  final MetaModel? meta;
  final LinksModel? links;

  ObjectListModel({
    required this.items,
    this.meta,
    this.links,
  });

  factory ObjectListModel.fromJson(
    Map<String, dynamic> json,
    T? Function(Map<String, dynamic> json) objectFromJson,
  ) {
    return ObjectListModel(
      items: JsonApiTransformableHelper.buildItemsList(json, objectFromJson) ?? [],
      links: JsonApiTransformableHelper.buildLinkModel(json),
      meta: JsonApiTransformableHelper.buildMetaModel(json),
    );
  }

  ObjectListModel<T> add(ObjectListModel<T> newList) {
    return newList.copyWith(items: [
      ...items,
      ...newList.items,
    ]);
  }

  bool hasLoadMore() {
    if (links == null) return false;

    // consider no more to load if stuck on same page
    Set<String?> result = {links?.pageNumber.next, links?.pageNumber.first, links?.pageNumber.prev};

    if (result.length == 1) return false;

    int self = int.tryParse(links?.pageNumber.self ?? '') ?? 0;
    int last = int.tryParse(links?.pageNumber.last ?? '') ?? 0;

    return self < last;
  }
}
