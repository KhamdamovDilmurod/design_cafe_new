
import 'package:bdm_cafe/model/table_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'enum/enum.dart';
import 'food_model.dart';

part 'table_detail_model.g.dart';

@JsonSerializable()
class TableDetailModel{
  TableModel table;
  TableOrderModel? order;

  TableDetailModel(this.table, this.order);

  factory TableDetailModel.fromJson(Map<String, dynamic> json) => _$TableDetailModelFromJson(json);

  Map<String,dynamic> toJson()=> _$TableDetailModelToJson(this);
}

@JsonSerializable()
class TableOrderModel{
  int order_id;
  int waiter_id;
  List<TableOrderProductModel> foods;
  
  TableOrderModel(this.order_id, this.waiter_id,this.foods);

  factory TableOrderModel.fromJson(Map<String, dynamic> json) => _$TableOrderModelFromJson(json);

  Map<String,dynamic> toJson()=> _$TableOrderModelToJson(this);
}

@JsonSerializable()
class TableOrderProductModel{
  int id;
  int order_id;
  int food_id;
  int amount;
  TableOrderProductStatusEnum status;
  int sell_price;
  int sum;
  FoodModel food;
  @JsonKey(ignore: true)
  int? newCount;
  
  TableOrderProductModel(this.id,this.order_id, this.food_id,this.amount,this.status,this.sell_price,this.sum, this.food);

  factory TableOrderProductModel.fromJson(Map<String, dynamic> json) => _$TableOrderProductModelFromJson(json);

  Map<String,dynamic> toJson()=> _$TableOrderProductModelToJson(this);
}