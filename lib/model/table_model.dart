import 'package:json_annotation/json_annotation.dart';

part 'table_model.g.dart';

@JsonSerializable()
class TableModel{
  final int id;
  final String name;
  final int room_id;
  final String? room_name;
  final int chair_count;
  final int active;
  final int own;

  TableModel(this.id,this.name, this.room_id, this.room_name, this.chair_count,  this
      .active, this
      .own);

  factory TableModel.fromJson(Map<String, dynamic> json) => _$TableModelFromJson(json);

  Map<String,dynamic> toJson()=> _$TableModelToJson(this);
}