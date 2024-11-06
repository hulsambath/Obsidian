import 'package:json_annotation/json_annotation.dart';
import 'package:vendor_app/core/models/base_model.dart';

part 'sample_model.g.dart';

@JsonSerializable()
class SampleModel extends BaseModel {
  final String name;
  final String address;

  @JsonKey(fromJson: BaseModel.toLocal)
  final DateTime? availableOn;

  final bool isApproved;
  final double price;
  final int quantity;

  SampleModel(
    this.availableOn,
    this.isApproved,
    this.price,
    this.quantity, {
    required this.name,
    required this.address,
  });

  factory SampleModel.fromjson(Map<String, dynamic> json) => _$SampleModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SampleModelToJson(this);
}
