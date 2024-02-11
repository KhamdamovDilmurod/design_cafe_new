// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableModel _$TableModelFromJson(Map<String, dynamic> json) => TableModel(
      json['id'] as int,
      json['name'] as String,
      json['room_id'] as int,
      json['room_name'] as String?,
      json['chair_count'] as int,
      json['active'] as int,
      json['own'] as int,
    );

Map<String, dynamic> _$TableModelToJson(TableModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'room_id': instance.room_id,
      'room_name': instance.room_name,
      'chair_count': instance.chair_count,
      'active': instance.active,
      'own': instance.own,
    };
