// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) => BaseModel(
      json['success'] as bool,
      json['message'] as String?,
      json['error_code'] as int?,
      json['error'],
      json['data'],
    );

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'error_code': instance.error_code,
      'error': instance.error,
      'data': instance.data,
    };
