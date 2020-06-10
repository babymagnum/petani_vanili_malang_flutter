import 'package:json_annotation/json_annotation.dart';

part 'province.g.dart';

@JsonSerializable()
class Province {

  Province(this.id, this.name);

  int id;
  String name;

  factory Province.fromJson(Map<String, dynamic> json) => _$ProvinceFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}