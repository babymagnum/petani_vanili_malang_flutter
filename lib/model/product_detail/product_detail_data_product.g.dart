// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_data_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailDataProduct _$ProductDetailDataProductFromJson(
    Map<String, dynamic> json) {
  return ProductDetailDataProduct(
    json['id'] as int,
    json['name'] as String,
    json['slug'] as String,
    json['order_amount'] as int,
    json['min_price'] as int,
    json['max_price'] as int,
    json['description'] as String,
    json['created_at'] as String,
    json['unit'] as String,
  );
}

Map<String, dynamic> _$ProductDetailDataProductToJson(
        ProductDetailDataProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'order_amount': instance.order_amount,
      'min_price': instance.min_price,
      'max_price': instance.max_price,
      'description': instance.description,
      'created_at': instance.created_at,
      'unit': instance.unit,
    };
