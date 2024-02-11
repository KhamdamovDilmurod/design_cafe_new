// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableDetailModel _$TableDetailModelFromJson(Map<String, dynamic> json) =>
    TableDetailModel(
      TableModel.fromJson(json['table'] as Map<String, dynamic>),
      json['order'] == null
          ? null
          : TableOrderModel.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TableDetailModelToJson(TableDetailModel instance) =>
    <String, dynamic>{
      'table': instance.table,
      'order': instance.order,
    };

TableOrderModel _$TableOrderModelFromJson(Map<String, dynamic> json) =>
    TableOrderModel(
      json['order_id'] as int,
      json['waiter_id'] as int,
      (json['foods'] as List<dynamic>)
          .map(
              (e) => TableOrderProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TableOrderModelToJson(TableOrderModel instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'waiter_id': instance.waiter_id,
      'foods': instance.foods,
    };

TableOrderProductModel _$TableOrderProductModelFromJson(
        Map<String, dynamic> json) =>
    TableOrderProductModel(
      json['id'] as int,
      json['order_id'] as int,
      json['food_id'] as int,
      json['amount'] as int,
      $enumDecode(_$TableOrderProductStatusEnumEnumMap, json['status']),
      json['sell_price'] as int,
      json['sum'] as int,
      FoodModel.fromJson(json['food'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TableOrderProductModelToJson(
        TableOrderProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.order_id,
      'food_id': instance.food_id,
      'amount': instance.amount,
      'status': _$TableOrderProductStatusEnumEnumMap[instance.status]!,
      'sell_price': instance.sell_price,
      'sum': instance.sum,
      'food': instance.food,
    };

const _$TableOrderProductStatusEnumEnumMap = {
  TableOrderProductStatusEnum.WAITING: 'waiting',
  TableOrderProductStatusEnum.SENDING: 'sending',
  TableOrderProductStatusEnum.PROCESSING: 'processing',
  TableOrderProductStatusEnum.COMPLETED: 'completed',
  TableOrderProductStatusEnum.CANCEL: 'cancel',
};
