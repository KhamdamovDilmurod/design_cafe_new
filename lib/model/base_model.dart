
import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseModel{
  final bool success;
  final String? message;
  final int? error_code;
  final dynamic error;
  final dynamic data;

  BaseModel(this.success, this.message, this.error_code, this.error, this.data);

  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}