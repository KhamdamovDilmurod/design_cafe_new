
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel{
  int id;
  String name;
  double price;
  String measurement;
  int is_have;
  String picture;


  ProductModel(this.id, this.name, this.price, this.measurement, this.is_have, this.picture);

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String,dynamic> toJson()=> _$ProductModelToJson(this);
}