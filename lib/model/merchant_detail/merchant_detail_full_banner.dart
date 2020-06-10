import 'package:json_annotation/json_annotation.dart';

part 'merchant_detail_full_banner.g.dart';

@JsonSerializable()
class MerchantDetailFullBanner {

  MerchantDetailFullBanner(this.image);

  String image;

  factory MerchantDetailFullBanner.fromJson(Map<String, dynamic> json) => _$MerchantDetailFullBannerFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantDetailFullBannerToJson(this);
}