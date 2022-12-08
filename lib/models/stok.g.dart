// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stok _$StokFromJson(Map<String, dynamic> json) => Stok(
      stok_id: json['stok_id'] as int,
      barang_id: json['barang_id'] as int,
      jumlah: json['jumlah'] as int,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$StokToJson(Stok instance) => <String, dynamic>{
      'stok_id': instance.stok_id,
      'barang_id': instance.barang_id,
      'jumlah': instance.jumlah,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
    };
