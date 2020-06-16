import 'package:json_annotation/json_annotation.dart';
import 'product_detail_data_product.dart';
import 'product_category.dart';
import 'product_detail_merchant_product.dart';

part 'product_detail_data.g.dart';

@JsonSerializable()
class ProductDetailData {

  ProductDetailData(this.product, this.category, this.images, this.merchant);

  ProductDetailDataProduct product;
  ProductCategory category;
  List<String> images;
  ProductDetailMerchantProduct merchant;

  factory ProductDetailData.fromJson(Map<String, dynamic> json) => _$ProductDetailDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailDataToJson(this);

}