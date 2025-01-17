// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
      count: (json['count'] as num?)?.toInt(),
      totalCount: (json['total_count'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      unreadCount: (json['unread_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
      'count': instance.count,
      'total_count': instance.totalCount,
      'total_pages': instance.totalPages,
      'current_page': instance.currentPage,
      'unread_count': instance.unreadCount,
    };
