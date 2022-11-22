import 'package:flutter/material.dart';

class LaporanProduk extends StatelessWidget {
  const LaporanProduk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan Produk"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text("Produk"),
    );
  }
}
