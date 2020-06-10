// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantDetail _$MerchantDetailFromJson(Map<String, dynamic> json) {
  return MerchantDetail(
    json['status'] as String,
    json['data'] == null
        ? null
        : MerchantDetailData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MerchantDetailToJson(MerchantDetail instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
