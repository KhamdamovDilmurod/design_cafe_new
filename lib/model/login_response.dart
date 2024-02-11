import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse{
  final int id;
  final String username;
  final String email;
  final String status;
  final String token;
  final String role;

  LoginResponse(this.id, this.username, this.email, this.status, this.token, this.role);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
