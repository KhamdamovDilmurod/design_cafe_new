import 'package:json_annotation/json_annotation.dart';

part 'control_food_model.g.dart';

@JsonSerializable()
class ControlFoodModel{

  int status;
  int food_id;

  ControlFoodModel(this.status, this.food_id);

  factory ControlFoodModel.fromJson(Map<String, dynamic> json) => _$ControlFoodModelFromJson(json);

  Map<String,dynamic> toJson()=> _$ControlFoodModelToJson(this);

}

/*
api/v1/mobile/food/controll
POST
BODY
{
  "status": 0,
  "food_id": 1
}
 */