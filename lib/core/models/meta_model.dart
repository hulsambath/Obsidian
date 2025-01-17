import 'package:json_annotation/json_annotation.dart';
import 'package:cm_vendor_app/core/models/base_model.dart';

part 'meta_model.g.dart';

@JsonSerializable()
class MetaModel extends BaseModel {
  final int? count;
  final int? totalCount;
  final int? totalPages;
  final int? currentPage;
  final int? unreadCount;

  MetaModel({
    this.count,
    this.totalCount,
    this.totalPages,
    this.currentPage,
    this.unreadCount,
  });

  @override
  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
  factory MetaModel.fromJson(Map<String, dynamic> json) => _$MetaModelFromJson(json);
}
