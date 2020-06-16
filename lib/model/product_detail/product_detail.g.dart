// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) {
  return ProductDetail(
    json['status'] as String,
    json['data'] == null
        ? null
        : ProductDetailData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductDetailToJson(ProductDetail instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
