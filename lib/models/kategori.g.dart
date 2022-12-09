// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kategori.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kategori _$KategoriFromJson(Map<String, dynamic> json) => Kategori(
      kategori_id: json['kategori_id'] as int,
      nama: json['nama'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$KategoriToJson(Kategori instance) => <String, dynamic>{
      'kategori_id': instance.kategori_id,
      'nama': instance.nama,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
    };
