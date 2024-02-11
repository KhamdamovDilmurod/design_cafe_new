

import 'package:json_annotation/json_annotation.dart';

enum TableOrderProductStatusEnum {
  @JsonValue("waiting") WAITING,
  @JsonValue("sending") SENDING,
  @JsonValue("processing") PROCESSING,
  @JsonValue("completed") COMPLETED,
  @JsonValue("cancel") CANCEL,
}