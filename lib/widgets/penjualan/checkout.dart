import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pbl_kasir/models/barang_transaksi.dart';
import 'package:http/http.dart' as http;
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';
import 'package:pbl_kasir/widgets/penjualan/nota.dart';

class CheckOut extends StatefulWidget {
  List<BarangTransaksi> listBarang;
  CheckOut({super.key, required this.listBarang});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final _formKey = GlobalKey<FormState>();
  int total = 0;
  TextEditingController uang = TextEditingController();
  Future<void> transaksi() async {
    Uri url = Uri.parse("${BaseUrl.url}/transaksi");
    try {
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': Auth.token
        },
        body: jsonEncode({'data': widget.listBarang}),
      );
      print(response.body);
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  getTotal() {
    int p = 0;
    widget.listBarang.forEach(
      (element) {
        p += element.total;
      },
    );
    setState(() {
      total = p;
    });
  }

  @override
  void initState() {
    super.initState();
    getTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckOut"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: ListView(children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Nama Barang",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text("Harga Barang",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text("Jumlah",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text("Total",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: widget.listBarang.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.listBarang[index].nama),
                        Text(widget.listBarang[index].harga_jual.toString()),
                        Text(widget.listBarang[index].jumlah.toString()),
                        Text(widget.listBarang[index].total.toString()),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Keseluruhan : ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$total",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Masukkan Uang : ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: uang,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Wajib Di isi';
                          } else if (total > int.parse(uang.text)) {
                            return 'Uang kurang';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  transaksi().then((value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                            child: Nota(
                              listBarang: widget.listBarang,
                              uang: int.parse(uang.text),
                              totalKeseluruhan: total,
                            ),
                            type: PageTransitionType.leftToRight),
                        (route) => false);
                  });
                }
              },
              child: const Text('Proses Transaksi'),
            ),
          ]),
        ),
      ),
    );
  }
}
