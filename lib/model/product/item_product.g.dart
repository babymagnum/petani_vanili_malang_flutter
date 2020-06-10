// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemProduct _$ItemProductFromJson(Map<String, dynamic> json) {
  return ItemProduct(
    json['id'] as int,
    json['name'] as String,
    json['order_amount'] as int,
    json['min_price'] as int,
    json['max_price'] as int,
    json['description'] as String,
    json['create_date'] as String,
    json['category'] as String,
    json['unit'] as String,
    (json['images'] as List)?.map((e) => e as String)?.toList(),
    json['status'] as int,
    json['merchant'] == null
        ? null
        : MerchantProduct.fromJson(json['merchant'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemProductToJson(ItemProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order_amount': instance.order_amount,
      'min_price': instance.min_price,
      'max_price': instance.max_price,
      'description': instance.description,
      'create_date': instance.create_date,
      'category': instance.category,
      'unit': instance.unit,
      'images': instance.images,
      'status': instance.status,
      'merchant': instance.merchant,
    };
