// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantProduct _$MerchantProductFromJson(Map<String, dynamic> json) {
  return MerchantProduct(
    json['id'] as int,
    json['name'] as String,
    json['slug'] as String,
    json['address'] as String,
    json['email'] as String,
    json['phone'] as String,
    json['whatsapp'] as String,
    json['province'] == null
        ? null
        : Province.fromJson(json['province'] as Map<String, dynamic>),
    json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MerchantProductToJson(MerchantProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'address': instance.address,
      'email': instance.email,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'city': instance.city,
      'province': instance.province,
    };
