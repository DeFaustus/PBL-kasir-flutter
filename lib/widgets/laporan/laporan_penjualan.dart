import 'package:flutter/material.dart';

class LaporanPenjualan extends StatelessWidget {
  const LaporanPenjualan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan Penjualan"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text("Penjualan"),
    );
  }
}
