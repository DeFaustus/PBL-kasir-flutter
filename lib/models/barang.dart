// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:pbl_kasir/models/stok.dart';
part 'barang.g.dart';

@JsonSerializable(explicitToJson: true)
class Barang {
  int barang_id;
  int kategori_id;
  String nama;
  int harga_beli;
  int harga_jual;
  DateTime created_at;
  DateTime updated_at;
  Stok stok;
  Barang({
    required this.barang_id,
    required this.kategori_id,
    required this.nama,
    required this.harga_beli,
    required this.harga_jual,
    required this.created_at,
    required this.updated_at,
    required this.stok,
  });
  factory Barang.fromJson(Map<String, dynamic> json) => _$BarangFromJson(json);
  Map<String, dynamic> toJson() => _$BarangToJson(this);
}
