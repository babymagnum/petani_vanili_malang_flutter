// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_detail_packages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantDetailPackages _$MerchantDetailPackagesFromJson(
    Map<String, dynamic> json) {
  return MerchantDetailPackages(
    json['full_banner'] == null
        ? null
        : MerchantDetailFullBanner.fromJson(
            json['full_banner'] as Map<String, dynamic>),
    json['running_text'] == null
        ? null
        : MerchantDetailRunningText.fromJson(
            json['running_text'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MerchantDetailPackagesToJson(
        MerchantDetailPackages instance) =>
    <String, dynamic>{
      'running_text': instance.running_text,
      'full_banner': instance.full_banner,
    };
