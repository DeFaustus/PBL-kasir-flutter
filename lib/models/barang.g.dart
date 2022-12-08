// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barang _$BarangFromJson(Map<String, dynamic> json) => Barang(
      barang_id: json['barang_id'] as int,
      kategori_id: json['kategori_id'] as int,
      nama: json['nama'] as String,
      harga_beli: json['harga_beli'] as int,
      harga_jual: json['harga_jual'] as int,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: DateTime.parse(json['updated_at'] as String),
      stok: Stok.fromJson(json['stok'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BarangToJson(Barang instance) => <String, dynamic>{
      'barang_id': instance.barang_id,
      'kategori_id': instance.kategori_id,
      'nama': instance.nama,
      'harga_beli': instance.harga_beli,
      'harga_jual': instance.harga_jual,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
      'stok': instance.stok.toJson(),
    };
