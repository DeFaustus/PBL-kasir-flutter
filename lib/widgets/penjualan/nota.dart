import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pbl_kasir/models/barang_transaksi.dart';

class Nota extends StatelessWidget {
  final List<BarangTransaksi> listBarang;
  final int uang;
  final int totalKeseluruhan;
  const Nota(
      {super.key,
      required this.listBarang,
      required this.totalKeseluruhan,
      required this.uang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cetak Nota"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Column(children: [
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
                itemCount: listBarang.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(listBarang[index].nama),
                        Text(listBarang[index].harga_jual.toString()),
                        Text(listBarang[index].jumlah.toString()),
                        Text(listBarang[index].total.toString()),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Total Keseluruhan      : $totalKeseluruhan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Total Uang      : $uang",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Kembalian      : ${uang - totalKeseluruhan}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/home", (route) => false);
                  },
                  child: Text("Kembali")),
            ),
          ]),
        ),
      ),
    );
  }
}
