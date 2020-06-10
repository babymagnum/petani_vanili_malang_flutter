import 'package:json_annotation/json_annotation.dart';
import 'merchant_detail_data.dart';

part 'merchant_detail.g.dart';

@JsonSerializable()
class MerchantDetail {

  MerchantDetail(this.status, this.data);

  String status;
  MerchantDetailData data;

  factory MerchantDetail.fromJson(Map<String, dynamic> json) => _$MerchantDetailFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantDetailToJson(this);

}