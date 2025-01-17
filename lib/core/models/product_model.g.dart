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
      availableOn: toLocal(json['available_on']),
      slug: json['slug'] as String?,
      metaDescription: json['meta_description'] as String?,
      metaKeywords: json['meta_keywords'] as String?,
      updatedAt: toLocal(json['updated_at']),
      sku: json['sku'] as String?,
      publicMetadata: json['public_metadata'] as Map<String, dynamic>?,
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
      kyc: (toInt(json, 'kyc') as num?)?.toInt(),
      kycFields: json['kyc_fields'] as List<dynamic>?,
      allowedUploadLater: json['allowed_upload_later'] as bool?,
      allowAnonymousBooking: json['allow_anonymous_booking'] as bool?,
      useVideoAsDefault: json['use_video_as_default'] as bool?,
      revealDescription: json['reveal_description'] as bool?,
      purchasableOn: json['purchasable_on'] as String?,
      purchasableOnApp: json['purchasable_on_app'] as bool?,
      purchasableOnWeb: json['purchasable_on_web'] as bool?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'description': instance.description,
      'available_on': instance.availableOn?.toIso8601String(),
      'slug': instance.slug,
      'meta_description': instance.metaDescription,
      'meta_keywords': instance.metaKeywords,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'sku': instance.sku,
      'public_metadata': instance.publicMetadata,
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
    };
