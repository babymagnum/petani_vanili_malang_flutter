import 'package:json_annotation/json_annotation.dart';
import 'merchant_detail_merchant.dart';
import 'merchant_detail_packages.dart';

part 'merchant_detail_data.g.dart';

@JsonSerializable()
class MerchantDetailData {

  MerchantDetailData(this.merchant, this.packages);

  MerchantDetailMerchant merchant;
  MerchantDetailPackages packages;

  factory MerchantDetailData.fromJson(Map<String, dynamic> json) => _$MerchantDetailDataFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantDetailDataToJson(this);

}