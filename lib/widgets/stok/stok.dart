// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pbl_kasir/widgets/stok/tambah_barang.dart';
import 'package:pbl_kasir/models/response.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:pbl_kasir/widgets/stok/update_barang.dart';

class StokPage extends StatefulWidget {
  const StokPage({super.key});

  @override
  State<StokPage> createState() => _StokPageState();
}

class _StokPageState extends State<StokPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stok"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: Auth.isAdmin != true
          ? Container()
          : FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const TambahBarang(),
                    type: PageTransitionType.leftToRight,
                  ),
                ).then((value) => setState(() {}));
              },
              child: Icon(Icons.add),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: cariController,
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
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 70,
                            height: 60,
                            color: Theme.of(context).primaryColor,
                            child: Icon(
                              Icons.search_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onTap: () {
                          // if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Mencari Data')),
                          );
                          // }
                        },
                      ),
                    ],
                  ),
                ),
              )),
          FutureBuilder<Response>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.data.length,
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
                                    snapshot.data!.data[index].nama.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
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
                                        snapshot.data!.data[index].harga_beli
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
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
                                        snapshot.data!.data[index].harga_jual
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
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
                                        snapshot.data!.data[index].stok
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
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
                                        snapshot.data!.data[index].supplier
                                            .nama_supplier
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 80,
                                      ),
                                      Text(
                                        'Kategori      :',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data!.data[index].kategori.nama
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Auth.isAdmin != true
                                      ? SizedBox()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 100,
                                            ),
                                            GestureDetector(
                                              child: Icon(
                                                Icons.edit,
                                                color: Colors.yellow,
                                                size: 30,
                                              ),
                                              onTap: () => Navigator.push(
                                                context,
                                                PageTransition(
                                                    child: UpdateBarang(
                                                      barangId: snapshot.data!
                                                          .data[index].barang_id
                                                          .toString(),
                                                      kategoriId: snapshot
                                                          .data!
                                                          .data[index]
                                                          .kategori
                                                          .kategori_id
                                                          .toString(),
                                                      supplierId: snapshot
                                                          .data!
                                                          .data[index]
                                                          .supplier
                                                          .supplier_id
                                                          .toString(),
                                                      namaBarang: snapshot.data!
                                                          .data[index].nama,
                                                      hargaBeli: snapshot
                                                          .data!
                                                          .data[index]
                                                          .harga_beli
                                                          .toString(),
                                                      hargaJual: snapshot
                                                          .data!
                                                          .data[index]
                                                          .harga_jual
                                                          .toString(),
                                                      stok: snapshot.data!
                                                          .data[index].stok
                                                          .toString(),
                                                    ),
                                                    type: PageTransitionType
                                                        .leftToRight),
                                              ).then((value) => setState(
                                                    () {},
                                                  )),
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
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Container(
                  margin: EdgeInsets.only(top: 100),
                  child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
