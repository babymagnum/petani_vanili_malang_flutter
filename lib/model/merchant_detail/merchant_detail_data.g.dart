// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantDetailData _$MerchantDetailDataFromJson(Map<String, dynamic> json) {
  return MerchantDetailData(
    json['merchant'] == null
        ? null
        : MerchantDetailMerchant.fromJson(
            json['merchant'] as Map<String, dynamic>),
    json['packages'] == null
        ? null
        : MerchantDetailPackages.fromJson(
            json['packages'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MerchantDetailDataToJson(MerchantDetailData instance) =>
    <String, dynamic>{
      'merchant': instance.merchant,
      'packages': instance.packages,
    };
