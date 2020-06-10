import 'package:dribbble_clone/model/merchant_detail/city.dart';
import 'package:dribbble_clone/model/merchant_detail/merchant_level.dart';
import 'package:dribbble_clone/model/merchant_detail/province.dart';
import 'package:json_annotation/json_annotation.dart';

part 'merchant_detail_merchant.g.dart';

@JsonSerializable()
class MerchantDetailMerchant {

  MerchantDetailMerchant(this.city, this.province, this.id, this.longitude,
      this.latitude, this.zip, this.whatsapp, this.tagline, this.publish_date,
      this.province_id, this.phone, this.name, this.merchant_levels_id, this.merchant_level,
      this.ktp_path, this.email, this.description, this.city_id, this.address, this.logo);

  int id;
  String name;
  String email;
  String phone;
  String whatsapp;
  String address;
  int province_id;
  int city_id;
  String zip;
  String description;
  String tagline;
  String publish_date;
  int merchant_levels_id;
  String ktp_path;
  String latitude;
  String longitude;
  String logo;
  MerchantLevel merchant_level;
  Province province;
  City city;

  factory MerchantDetailMerchant.fromJson(Map<String, dynamic> json) => _$MerchantDetailMerchantFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantDetailMerchantToJson(this);

}