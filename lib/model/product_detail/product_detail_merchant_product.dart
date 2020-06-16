import 'package:dribbble_clone/model/merchant_detail/city.dart';
import 'package:dribbble_clone/model/merchant_detail/province.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_detail_merchant_product.g.dart';

@JsonSerializable()
class ProductDetailMerchantProduct {

  ProductDetailMerchantProduct(this.id, this.user_id, this.name, this.slug,
      this.email, this.phone, this.whatsapp, this.address, this.logo, this.description,
      this.tagline, this.created_at, this.zip, this.province, this.city, this.level);

  int id;
  int user_id;
  String name;
  String slug;
  String email;
  String phone;
  String whatsapp;
  String address;
  String logo;
  String description;
  String tagline;
  String created_at;
  String zip;
  Province province;
  City city;
  String level;

  factory ProductDetailMerchantProduct.fromJson(Map<String, dynamic> json) => _$ProductDetailMerchantProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailMerchantProductToJson(this);

}