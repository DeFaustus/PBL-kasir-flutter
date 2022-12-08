// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'stok.g.dart';

@JsonSerializable(explicitToJson: true)
class Stok {
  int stok_id;
  int barang_id;
  int jumlah;
  DateTime created_at;
  DateTime updated_at;
  Stok({
    required this.stok_id,
    required this.barang_id,
    required this.jumlah,
    required this.created_at,
    required this.updated_at,
  });
  factory Stok.fromJson(Map<String, dynamic> json) => _$StokFromJson(json);

  Map<String, dynamic> toJson() => _$StokToJson(this);
}
