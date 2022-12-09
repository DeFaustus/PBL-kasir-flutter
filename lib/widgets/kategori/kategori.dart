// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pbl_kasir/models/kategori_response.dart';
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:pbl_kasir/widgets/kategori/tambah_kategori.dart';

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  Future<KategoriResponse> getKategori() async {
    try {
      Uri url = Uri.parse(BaseUrl.url + '/kategori');
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': Auth.token
      });
      return KategoriResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw new FormatException(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategori"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          PageTransition(
              child: const TambahKategori(),
              type: PageTransitionType.leftToRight),
        ).then((value) => setState(() {})),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FutureBuilder<KategoriResponse>(
        future: getKategori(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
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
                              snapshot.data!.data[index].nama,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
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
                              ],
                            ),
                          ],
                        ),
                      )),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }
}
