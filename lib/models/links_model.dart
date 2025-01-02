import 'package:json_annotation/json_annotation.dart';
import 'package:vendor_app/helpers/app_helpers.dart';
import 'package:vendor_app/models/base_model.dart';

part 'links_model.g.dart';

@JsonSerializable()
class LinksModel extends BaseModel {
  final String? self;
  final String? next;
  final String? prev;
  final String? last;
  final String? first;

  LinksModel? _pageNumber;
  LinksModel get pageNumber => _pageNumber ??= _getPageNumber();

  LinksModel({
    this.self,
    this.next,
    this.prev,
    this.last,
    this.first,
  });

  LinksModel _getPageNumber() {
    LinksModel newLinks = LinksModel(
      first: AppHelper.queryParameters(url: first ?? '', param: 'page'),
      last: AppHelper.queryParameters(url: last ?? '', param: 'page'),
      next: AppHelper.queryParameters(url: next ?? '', param: 'page'),
      prev: AppHelper.queryParameters(url: prev ?? '', param: 'page'),
      self: AppHelper.queryParameters(url: self ?? '', param: 'page'),
    );
    return newLinks;
  }

  @override
  Map<String, dynamic> toJson() => _$LinksModelToJson(this);
  factory LinksModel.fromJson(Map<String, dynamic> json) => _$LinksModelFromJson(json);
}
