
import 'package:json_annotation/json_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable()
class FoodModel{
  int id;
  String name;
  int sell_price;
  String picture;
  String measurement;
  int? is_have;
  @JsonKey(ignore: true)
  var cartCount = 0.0;

  FoodModel(this.id, this.name,this.sell_price, this.picture, this.measurement, this.is_have);

  factory FoodModel.fromJson(Map<String, dynamic> json) => _$FoodModelFromJson(json);

  Map<String,dynamic> toJson()=> _$FoodModelToJson(this);
}