// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantLevel _$MerchantLevelFromJson(Map<String, dynamic> json) {
  return MerchantLevel(
    json['description'] as String,
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$MerchantLevelToJson(MerchantLevel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
