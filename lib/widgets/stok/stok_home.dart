// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl_kasir/models/response.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;

class StokHomePage extends StatefulWidget {
  const StokHomePage({super.key});

  @override
  State<StokHomePage> createState() => _StokHomePageState();
}

class _StokHomePageState extends State<StokHomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController cariController = TextEditingController();

  Future<Response> getData() async {
    Uri url = Uri.parse(BaseUrl.url + '/barang');
    var response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': Auth.token
    });
    return Response.fromJson(jsonDecode(response.body));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFormField(
                        controller: cariController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Masukkan Kode Barang/Nama Barang',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tidak Boleh Kosong';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Mencari Data')),
                              );
                            }
                          },
                          child: const Text('Cari Barang'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Celana Jeans Ukuran Xl",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              SizedBox(
                                width: 80,
                              ),
                              Text(
                                'Harga Beli : ',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '5000',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              SizedBox(
                                width: 80,
                              ),
                              Text(
                                'Harga Jual : ',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '7000',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              SizedBox(
                                width: 80,
                              ),
                              Text(
                                'Supplier      :',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Prayit',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              SizedBox(
                                width: 80,
                              ),
                              Text(
                                'Stok          :',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '100',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 100,
                              ),
                              Icon(
                                Icons.edit,
                                color: Colors.yellow,
                                size: 30,
                              ),
                              Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                                size: 30,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Tambah Stok"),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
