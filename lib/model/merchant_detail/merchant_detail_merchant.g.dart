// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_detail_merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantDetailMerchant _$MerchantDetailMerchantFromJson(
    Map<String, dynamic> json) {
  return MerchantDetailMerchant(
    json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
    json['province'] == null
        ? null
        : Province.fromJson(json['province'] as Map<String, dynamic>),
    json['id'] as int,
    json['longitude'] as String,
    json['latitude'] as String,
    json['zip'] as String,
    json['whatsapp'] as String,
    json['tagline'] as String,
    json['publish_date'] as String,
    json['province_id'] as int,
    json['phone'] as String,
    json['name'] as String,
    json['merchant_levels_id'] as int,
    json['merchant_level'] == null
        ? null
        : MerchantLevel.fromJson(
            json['merchant_level'] as Map<String, dynamic>),
    json['ktp_path'] as String,
    json['email'] as String,
    json['description'] as String,
    json['city_id'] as int,
    json['address'] as String,
    json['logo'] as String,
  );
}

Map<String, dynamic> _$MerchantDetailMerchantToJson(
        MerchantDetailMerchant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'address': instance.address,
      'province_id': instance.province_id,
      'city_id': instance.city_id,
      'zip': instance.zip,
      'description': instance.description,
      'tagline': instance.tagline,
      'publish_date': instance.publish_date,
      'merchant_levels_id': instance.merchant_levels_id,
      'ktp_path': instance.ktp_path,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'logo': instance.logo,
      'merchant_level': instance.merchant_level,
      'province': instance.province,
      'city': instance.city,
    };
