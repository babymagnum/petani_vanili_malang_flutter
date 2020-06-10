// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_detail_running_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantDetailRunningText _$MerchantDetailRunningTextFromJson(
    Map<String, dynamic> json) {
  return MerchantDetailRunningText(
    json['id'] as int,
    json['created_at'] as String,
    json['merchants_id'] as int,
    json['text'] as String,
  );
}

Map<String, dynamic> _$MerchantDetailRunningTextToJson(
        MerchantDetailRunningText instance) =>
    <String, dynamic>{
      'id': instance.id,
      'merchants_id': instance.merchants_id,
      'text': instance.text,
      'created_at': instance.created_at,
    };
