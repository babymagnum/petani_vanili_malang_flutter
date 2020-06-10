import 'package:json_annotation/json_annotation.dart';

part 'merchant_level.g.dart';

@JsonSerializable()
class MerchantLevel {

  MerchantLevel(this.description, this.id, this.name);

  int id;
  String name;
  String description;

  factory MerchantLevel.fromJson(Map<String, dynamic> json) => _$MerchantLevelFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantLevelToJson(this);

}