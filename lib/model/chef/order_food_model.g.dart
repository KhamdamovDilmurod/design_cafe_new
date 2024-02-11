// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderFoodModel _$OrderFoodModelFromJson(Map<String, dynamic> json) =>
    OrderFoodModel(
      json['id'] as int,
      json['order_id'] as int,
      json['table_name'] as String,
      json['food_name'] as String,
      json['measurement'] as String,
      json['waiter_name'] as String,
      json['count'] as int,
      json['status'] as String,
      json['comment'] as String?,
      json['datetime'] as int,
    );

Map<String, dynamic> _$OrderFoodModelToJson(OrderFoodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.order_id,
      'table_name': instance.table_name,
      'food_name': instance.food_name,
      'measurement': instance.measurement,
      'waiter_name': instance.waiter_name,
      'count': instance.count,
      'status': instance.status,
      'comment': instance.comment,
      'datetime': instance.datetime,
    };
