import 'package:json_annotation/json_annotation.dart';
import 'merchant_product.dart';

part 'item_product.g.dart';

@JsonSerializable()
class ItemProduct {

  ItemProduct(this.id, this.name, this.order_amount, this.min_price, this.max_price,
      this.description, this.create_date, this.category, this.unit, this.images,
      this.status, this.merchant);

  int id;
  String name;
  int order_amount;
  int min_price;
  int max_price;
  String description;
  String create_date;
  String category;
  String unit;
  List<String> images = List();
  List<String> videos = List();
  int status;
  MerchantProduct merchant;

  factory ItemProduct.fromJson(Map<String, dynamic> json) => _$ItemProductFromJson(json);
  Map<String, dynamic> toJson() => _$ItemProductToJson(this);

}