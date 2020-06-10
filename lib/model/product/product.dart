import 'package:json_annotation/json_annotation.dart';
import 'item_product.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {

  Product(this.data, this.current_page, this.total, this.last_page);

  List<ItemProduct> data;
  int current_page;
  int total;
  int last_page;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

}