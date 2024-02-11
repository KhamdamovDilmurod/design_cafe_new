
import 'package:json_annotation/json_annotation.dart';

part 'order_food_model.g.dart';

@JsonSerializable()
class OrderFoodModel{
  int id;
  int order_id;
  String table_name;
  String food_name;
  String measurement;
  String waiter_name;
  int count;
  String status;
  String? comment;
  int datetime;

  OrderFoodModel(this.id, this.order_id, this.table_name, this.food_name, this.measurement, this.waiter_name, this.count,
      this.status, this.comment, this.datetime);

  factory OrderFoodModel.fromJson(Map<String, dynamic> json) => _$OrderFoodModelFromJson(json);

  Map<String,dynamic> toJson()=> _$OrderFoodModelToJson(this);
}
/*
    val id:Int,
    val order_id:String,
    val table:String,
    val food_name:String,
    val unit:String,
    val waiter:String,
    val count:Int,
    val status:String,
    val comment:String,
    val update_time:String
 */