// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinksModel _$LinksModelFromJson(Map<String, dynamic> json) => LinksModel(
      self: json['self'] as String?,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      last: json['last'] as String?,
      first: json['first'] as String?,
    );

Map<String, dynamic> _$LinksModelToJson(LinksModel instance) =>
    <String, dynamic>{
      'self': instance.self,
      'next': instance.next,
      'prev': instance.prev,
      'last': instance.last,
      'first': instance.first,
    };
