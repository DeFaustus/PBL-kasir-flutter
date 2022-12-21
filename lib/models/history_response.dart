// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:pbl_kasir/models/history.dart';
part 'history_response.g.dart';

@JsonSerializable(explicitToJson: true)
class HistoryResponse {
  bool status;
  List<History> data;
  HistoryResponse({
    required this.status,
    required this.data,
  });
  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryResponseToJson(this);
}
