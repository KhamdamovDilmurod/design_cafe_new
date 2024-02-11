

import 'package:json_annotation/json_annotation.dart';

class FoodCategoryModel{
  final int id;
  final String name;
    @JsonKey(ignore: true)
  var checked = false;

  FoodCategoryModel(this.id, this.name);


  factory FoodCategoryModel.fromJson(Map<String, dynamic> json){
    return FoodCategoryModel(
      json["id"] ?? 0,
      json["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}