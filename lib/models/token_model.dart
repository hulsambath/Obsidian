import 'package:json_annotation/json_annotation.dart';
import 'package:vendor_app/models/base_model.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends BaseModel {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  final String? refreshToken;
  final int? createdAt;

  String? get authorization {
    if (accessToken == null && tokenType == null) return null;
    return '$tokenType $accessToken';
  }

  TokenModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.refreshToken,
    this.createdAt,
  });

  @override
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);
}
