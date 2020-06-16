import 'package:json_annotation/json_annotation.dart';
import 'product_detail_data.dart';

part 'product_detail.g.dart';

@JsonSerializable()
class ProductDetail {

  ProductDetail(this.status, this.data);

  String status;
  ProductDetailData data;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => _$ProductDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);

}