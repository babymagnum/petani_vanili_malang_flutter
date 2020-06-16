// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_merchant_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailMerchantProduct _$ProductDetailMerchantProductFromJson(
    Map<String, dynamic> json) {
  return ProductDetailMerchantProduct(
    json['id'] as int,
    json['user_id'] as int,
    json['name'] as String,
    json['slug'] as String,
    json['email'] as String,
    json['phone'] as String,
    json['whatsapp'] as String,
    json['address'] as String,
    json['logo'] as String,
    json['description'] as String,
    json['tagline'] as String,
    json['created_at'] as String,
    json['zip'] as String,
    json['province'] == null
        ? null
        : Province.fromJson(json['province'] as Map<String, dynamic>),
    json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
    json['level'] as String,
  );
}

Map<String, dynamic> _$ProductDetailMerchantProductToJson(
        ProductDetailMerchantProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'slug': instance.slug,
      'email': instance.email,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'address': instance.address,
      'logo': instance.logo,
      'description': instance.description,
      'tagline': instance.tagline,
      'created_at': instance.created_at,
      'zip': instance.zip,
      'province': instance.province,
      'city': instance.city,
      'level': instance.level,
    };
