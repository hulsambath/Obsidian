// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SampleModel _$SampleModelFromJson(Map<String, dynamic> json) => SampleModel(
      BaseModel.toLocal(json['available_on']),
      json['is_approved'] as bool,
      (json['price'] as num).toDouble(),
      (json['quantity'] as num).toInt(),
      name: json['name'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$SampleModelToJson(SampleModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'available_on': instance.availableOn?.toIso8601String(),
      'is_approved': instance.isApproved,
      'price': instance.price,
      'quantity': instance.quantity,
    };
