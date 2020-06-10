import 'package:json_annotation/json_annotation.dart';
import 'merchant_detail_running_text.dart';
import 'merchant_detail_full_banner.dart';

part 'merchant_detail_packages.g.dart';

@JsonSerializable()
class MerchantDetailPackages {

  MerchantDetailPackages(this.full_banner, this.running_text);

  MerchantDetailRunningText running_text;
  MerchantDetailFullBanner full_banner;

  factory MerchantDetailPackages.fromJson(Map<String, dynamic> json) => _$MerchantDetailPackagesFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantDetailPackagesToJson(this);

}