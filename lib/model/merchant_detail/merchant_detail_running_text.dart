import 'package:json_annotation/json_annotation.dart';

part 'merchant_detail_running_text.g.dart';

@JsonSerializable()
class MerchantDetailRunningText {

  MerchantDetailRunningText(this.id, this.created_at, this.merchants_id, this.text);

  int id;
  int merchants_id;
  String text;
  String created_at;

  factory MerchantDetailRunningText.fromJson(Map<String, dynamic> json) => _$MerchantDetailRunningTextFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantDetailRunningTextToJson(this);

}