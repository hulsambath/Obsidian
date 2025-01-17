import 'package:json_annotation/json_annotation.dart';
import 'package:cm_vendor_app/core/models/base_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends BaseModel {
  final String? id;
  final String? type;
  final String? name;
  final String? description;

  @JsonKey(fromJson: toLocal)
  final DateTime? availableOn;

  final String? slug;
  final String? metaDescription;
  final String? metaKeywords;

  @JsonKey(fromJson: toLocal)
  final DateTime? updatedAt;

  final String? sku;
  final Map? publicMetadata;
  final bool? purchasable;
  final bool? inStock;
  final bool? backorderable;
  final bool? available;
  final String? currency;
  final String? price;
  final String? displayPrice;
  final String? compareAtPrice;
  final String? displayCompareAtPrice;
  final bool? needConfirmation;
  final String? productType;

  @JsonKey(readValue: toInt)
  final int? kyc;

  final List<dynamic>? kycFields;
  final bool? allowedUploadLater;
  final bool? allowAnonymousBooking;
  final bool? useVideoAsDefault;
  final bool? revealDescription;
  final String? purchasableOn;
  final bool? purchasableOnApp;
  final bool? purchasableOnWeb;

  // TODO: add all relations, variant model, option type model, image model, vendor model, option value model, state model (province)
  // final List<DefaultState>? variants;
  // final List<DefaultState>? optionTypes;
  // final List<DefaultState>? images;

  // final DefaultState? defaultVariant;
  // final DefaultState? primaryVariant;
  // final DefaultState? vendor;

  // final List<DefaultState>? variantKindOptionTypes;
  // final List<DefaultState>? productKindOptionTypes;
  // final List<DefaultState>? promotedOptionTypes;

  // DefaultState? defaultState;

  ProductModel({
    this.id,
    this.type,
    this.name,
    this.description,
    this.availableOn,
    this.slug,
    this.metaDescription,
    this.metaKeywords,
    this.updatedAt,
    this.sku,
    this.publicMetadata,
    this.purchasable,
    this.inStock,
    this.backorderable,
    this.available,
    this.currency,
    this.price,
    this.displayPrice,
    this.compareAtPrice,
    this.displayCompareAtPrice,
    this.needConfirmation,
    this.productType,
    this.kyc,
    this.kycFields,
    this.allowedUploadLater,
    this.allowAnonymousBooking,
    this.useVideoAsDefault,
    this.revealDescription,
    this.purchasableOn,
    this.purchasableOnApp,
    this.purchasableOnWeb,
    // this.variants,
    // this.optionTypes,
    // this.images,
    // this.defaultVariant,
    // this.primaryVariant,
    // this.vendor,
    // this.variantKindOptionTypes,
    // this.productKindOptionTypes,
    // this.promotedOptionTypes,
    // this.defaultState,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
