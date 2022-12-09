// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;

class TambahBarang extends StatefulWidget {
  const TambahBarang({super.key});

  @override
  State<TambahBarang> createState() => _TambahBarangState();
}

class _TambahBarangState extends State<TambahBarang> {
  final _formKeyBarang = GlobalKey<FormState>();
  String selectedValue = "";
  List<dynamic> listKategori = [];
  Future<void> getCategory() async {
    Uri url = Uri.parse(BaseUrl.url + '/kategori');
    try {
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': Auth.token
      });
      setState(() {
        listKategori = jsonDecode(response.body)['data'];
        selectedValue = listKategori[0]['kategori_id'].toString();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Barang"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _formKeyBarang,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Masukkan Kategori Barang',
                        ),
                        key: UniqueKey(),
                        hint: Text("Pilih Kategori"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tidak Boleh Kosong';
                          }
                          return null;
                        },
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: listKategori.map((item) {
                          return DropdownMenuItem(
                            value: item['kategori_id'].toString(),
                            child: Text(item['nama'].toString()),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Masukkan Nama Barang',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tidak Boleh Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Masukkan Harga Beli',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tidak Boleh Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Masukkan Harga Jual',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tidak Boleh Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Masukkan Jumlah Stok',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tidak Boleh Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKeyBarang.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Dalam Proses')),
                            );
                          }
                        },
                        child: const Text('Tambah Barang'),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
