import 'package:json_annotation/json_annotation.dart';
import 'package:vendor_app/models/base_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends BaseModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'available_on')
  String? availableOn;
  @JsonKey(name: 'slug')
  String? slug;
  @JsonKey(name: 'meta_description')
  String? metaDescription;
  @JsonKey(name: 'meta_keywords')
  String? metaKeywords;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'sku')
  String? sku;
  @JsonKey(name: 'public_metadata')
  PublicMetadata? publicMetadata;
  @JsonKey(name: 'purchasable')
  bool? purchasable;
  @JsonKey(name: 'in_stock')
  bool? inStock;
  @JsonKey(name: 'backorderable')
  bool? backorderable;
  @JsonKey(name: 'available')
  bool? available;
  @JsonKey(name: 'currency')
  String? currency;
  @JsonKey(name: 'price')
  String? price;
  @JsonKey(name: 'display_price')
  String? displayPrice;
  @JsonKey(name: 'compare_at_price')
  String? compareAtPrice;
  @JsonKey(name: 'display_compare_at_price')
  String? displayCompareAtPrice;
  @JsonKey(name: 'need_confirmation')
  bool? needConfirmation;
  @JsonKey(name: 'product_type')
  String? productType;
  @JsonKey(name: 'kyc')
  int? kyc;
  @JsonKey(name: 'kyc_fields')
  List<dynamic>? kycFields;
  @JsonKey(name: 'allowed_upload_later')
  bool? allowedUploadLater;
  @JsonKey(name: 'allow_anonymous_booking')
  bool? allowAnonymousBooking;
  @JsonKey(name: 'use_video_as_default')
  bool? useVideoAsDefault;
  @JsonKey(name: 'reveal_description')
  bool? revealDescription;
  @JsonKey(name: 'purchasable_on')
  String? purchasableOn;
  @JsonKey(name: 'purchasable_on_app')
  bool? purchasableOnApp;
  @JsonKey(name: 'purchasable_on_web')
  bool? purchasableOnWeb;
  @JsonKey(name: 'variants')
  List<DefaultState>? variants;
  @JsonKey(name: 'option_types')
  List<DefaultState>? optionTypes;
  @JsonKey(name: 'images')
  List<DefaultState>? images;
  @JsonKey(name: 'default_variant')
  DefaultState? defaultVariant;
  @JsonKey(name: 'primary_variant')
  DefaultState? primaryVariant;
  @JsonKey(name: 'vendor')
  DefaultState? vendor;
  @JsonKey(name: 'variant_kind_option_types')
  List<DefaultState>? variantKindOptionTypes;
  @JsonKey(name: 'product_kind_option_types')
  List<DefaultState>? productKindOptionTypes;
  @JsonKey(name: 'promoted_option_types')
  List<DefaultState>? promotedOptionTypes;
  @JsonKey(name: 'default_state')
  DefaultState? defaultState;

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
    this.variants,
    this.optionTypes,
    this.images,
    this.defaultVariant,
    this.primaryVariant,
    this.vendor,
    this.variantKindOptionTypes,
    this.productKindOptionTypes,
    this.promotedOptionTypes,
    this.defaultState,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class DefaultState {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'type')
  String? type;

  DefaultState({
    this.id,
    this.type,
  });

  factory DefaultState.fromJson(Map<String, dynamic> json) => _$DefaultStateFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultStateToJson(this);
}

@JsonSerializable()
class PublicMetadata {
  PublicMetadata();

  factory PublicMetadata.fromJson(Map<String, dynamic> json) => _$PublicMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$PublicMetadataToJson(this);
}
