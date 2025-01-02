// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      availableOn: json['available_on'] as String?,
      slug: json['slug'] as String?,
      metaDescription: json['meta_description'] as String?,
      metaKeywords: json['meta_keywords'] as String?,
      updatedAt: json['updated_at'] as String?,
      sku: json['sku'] as String?,
      publicMetadata: json['public_metadata'] == null
          ? null
          : PublicMetadata.fromJson(
              json['public_metadata'] as Map<String, dynamic>),
      purchasable: json['purchasable'] as bool?,
      inStock: json['in_stock'] as bool?,
      backorderable: json['backorderable'] as bool?,
      available: json['available'] as bool?,
      currency: json['currency'] as String?,
      price: json['price'] as String?,
      displayPrice: json['display_price'] as String?,
      compareAtPrice: json['compare_at_price'] as String?,
      displayCompareAtPrice: json['display_compare_at_price'] as String?,
      needConfirmation: json['need_confirmation'] as bool?,
      productType: json['product_type'] as String?,
      kyc: (json['kyc'] as num?)?.toInt(),
      kycFields: json['kyc_fields'] as List<dynamic>?,
      allowedUploadLater: json['allowed_upload_later'] as bool?,
      allowAnonymousBooking: json['allow_anonymous_booking'] as bool?,
      useVideoAsDefault: json['use_video_as_default'] as bool?,
      revealDescription: json['reveal_description'] as bool?,
      purchasableOn: json['purchasable_on'] as String?,
      purchasableOnApp: json['purchasable_on_app'] as bool?,
      purchasableOnWeb: json['purchasable_on_web'] as bool?,
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => DefaultState.fromJson(e as Map<String, dynamic>))
          .toList(),
      optionTypes: (json['option_types'] as List<dynamic>?)
          ?.map((e) => DefaultState.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => DefaultState.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultVariant: json['default_variant'] == null
          ? null
          : DefaultState.fromJson(
              json['default_variant'] as Map<String, dynamic>),
      primaryVariant: json['primary_variant'] == null
          ? null
          : DefaultState.fromJson(
              json['primary_variant'] as Map<String, dynamic>),
      vendor: json['vendor'] == null
          ? null
          : DefaultState.fromJson(json['vendor'] as Map<String, dynamic>),
      variantKindOptionTypes:
          (json['variant_kind_option_types'] as List<dynamic>?)
              ?.map((e) => DefaultState.fromJson(e as Map<String, dynamic>))
              .toList(),
      productKindOptionTypes:
          (json['product_kind_option_types'] as List<dynamic>?)
              ?.map((e) => DefaultState.fromJson(e as Map<String, dynamic>))
              .toList(),
      promotedOptionTypes: (json['promoted_option_types'] as List<dynamic>?)
          ?.map((e) => DefaultState.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultState: json['default_state'] == null
          ? null
          : DefaultState.fromJson(
              json['default_state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'description': instance.description,
      'available_on': instance.availableOn,
      'slug': instance.slug,
      'meta_description': instance.metaDescription,
      'meta_keywords': instance.metaKeywords,
      'updated_at': instance.updatedAt,
      'sku': instance.sku,
      'public_metadata': instance.publicMetadata?.toJson(),
      'purchasable': instance.purchasable,
      'in_stock': instance.inStock,
      'backorderable': instance.backorderable,
      'available': instance.available,
      'currency': instance.currency,
      'price': instance.price,
      'display_price': instance.displayPrice,
      'compare_at_price': instance.compareAtPrice,
      'display_compare_at_price': instance.displayCompareAtPrice,
      'need_confirmation': instance.needConfirmation,
      'product_type': instance.productType,
      'kyc': instance.kyc,
      'kyc_fields': instance.kycFields,
      'allowed_upload_later': instance.allowedUploadLater,
      'allow_anonymous_booking': instance.allowAnonymousBooking,
      'use_video_as_default': instance.useVideoAsDefault,
      'reveal_description': instance.revealDescription,
      'purchasable_on': instance.purchasableOn,
      'purchasable_on_app': instance.purchasableOnApp,
      'purchasable_on_web': instance.purchasableOnWeb,
      'variants': instance.variants?.map((e) => e.toJson()).toList(),
      'option_types': instance.optionTypes?.map((e) => e.toJson()).toList(),
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'default_variant': instance.defaultVariant?.toJson(),
      'primary_variant': instance.primaryVariant?.toJson(),
      'vendor': instance.vendor?.toJson(),
      'variant_kind_option_types':
          instance.variantKindOptionTypes?.map((e) => e.toJson()).toList(),
      'product_kind_option_types':
          instance.productKindOptionTypes?.map((e) => e.toJson()).toList(),
      'promoted_option_types':
          instance.promotedOptionTypes?.map((e) => e.toJson()).toList(),
      'default_state': instance.defaultState?.toJson(),
    };

DefaultState _$DefaultStateFromJson(Map<String, dynamic> json) => DefaultState(
      id: json['id'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$DefaultStateToJson(DefaultState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };

PublicMetadata _$PublicMetadataFromJson(Map<String, dynamic> json) =>
    PublicMetadata();

Map<String, dynamic> _$PublicMetadataToJson(PublicMetadata instance) =>
    <String, dynamic>{};
