import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RoomModel{
  final int id;
  String name;
  int room_active;
  String comment;
  @JsonKey(ignore: true)
  var checked = false;

  RoomModel(this.id,this.name,this.room_active,this.comment);

  factory RoomModel.fromJson(Map<String, dynamic> json){
    return RoomModel(
      json["id"] ?? 0,
      json["name"] ?? "",
      json["room_active"] ?? 0,
      json["comment"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "room_active": room_active,
    "comment": comment,
  };
}