// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailData _$ProductDetailDataFromJson(Map<String, dynamic> json) {
  return ProductDetailData(
    json['product'] == null
        ? null
        : ProductDetailDataProduct.fromJson(
            json['product'] as Map<String, dynamic>),
    json['category'] == null
        ? null
        : ProductCategory.fromJson(json['category'] as Map<String, dynamic>),
    (json['images'] as List)?.map((e) => e as String)?.toList(),
    json['merchant'] == null
        ? null
        : ProductDetailMerchantProduct.fromJson(
            json['merchant'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductDetailDataToJson(ProductDetailData instance) =>
    <String, dynamic>{
      'product': instance.product,
      'category': instance.category,
      'images': instance.images,
      'merchant': instance.merchant,
    };
