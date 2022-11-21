import 'package:flutter/material.dart';

class LaporanPenjualan extends StatelessWidget {
  const LaporanPenjualan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan Penjualan"),
      ),
      body: Text("Penjualan"),
    );
  }
}
