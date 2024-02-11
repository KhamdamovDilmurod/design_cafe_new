// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      json['id'] as int,
      json['name'] as String,
      (json['price'] as num).toDouble(),
      json['measurement'] as String,
      json['is_have'] as int,
      json['picture'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'measurement': instance.measurement,
      'is_have': instance.is_have,
      'picture': instance.picture,
    };
