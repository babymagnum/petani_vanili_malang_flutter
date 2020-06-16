import 'package:json_annotation/json_annotation.dart';

part 'product_detail_data_product.g.dart';

@JsonSerializable()
class ProductDetailDataProduct {

  ProductDetailDataProduct(this.id, this.name, this.slug, this.order_amount,
      this.min_price, this.max_price, this.description, this.created_at, this.unit);

  int id;
  String name;
  String slug;
  int order_amount;
  int min_price;
  int max_price;
  String description;
  String created_at;
  String unit;

  factory ProductDetailDataProduct.fromJson(Map<String, dynamic> json) => _$ProductDetailDataProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailDataProductToJson(this);

}