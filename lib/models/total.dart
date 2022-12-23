// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'total.g.dart';

@JsonSerializable(explicitToJson: true)
class TotalHariIni {
  bool status;
  String data;
  TotalHariIni({required this.status, required this.data});
  factory TotalHariIni.fromJson(Map<String, dynamic> json) =>
      _$TotalHariIniFromJson(json);
  Map<String, dynamic> toJson() => _$TotalHariIniToJson(this);
}
