import 'package:dribbble_clone/model/merchant_detail/city.dart';
import 'package:dribbble_clone/model/merchant_detail/province.dart';
import 'package:json_annotation/json_annotation.dart';

part 'merchant_product.g.dart';

@JsonSerializable()
class MerchantProduct {

  MerchantProduct(this.id, this.name, this.slug, this.address, this.email, this.phone,
      this.whatsapp, this.province, this.city);

  int id;
  String name;
  String slug;
  String address;
  String email;
  String phone;
  String whatsapp;
  City city;
  Province province;

  factory MerchantProduct.fromJson(Map<String, dynamic> json) => _$MerchantProductFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantProductToJson(this);

}