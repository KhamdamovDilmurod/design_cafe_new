// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) => FoodModel(
      json['id'] as int,
      json['name'] as String,
      json['sell_price'] as int,
      json['picture'] as String,
      json['measurement'] as String,
      json['is_have'] as int?,
    );

Map<String, dynamic> _$FoodModelToJson(FoodModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sell_price': instance.sell_price,
      'picture': instance.picture,
      'measurement': instance.measurement,
      'is_have': instance.is_have,
    };
