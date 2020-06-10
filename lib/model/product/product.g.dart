// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : ItemProduct.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['current_page'] as int,
    json['total'] as int,
    json['last_page'] as int,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'data': instance.data,
      'current_page': instance.current_page,
      'total': instance.total,
      'last_page': instance.last_page,
    };
