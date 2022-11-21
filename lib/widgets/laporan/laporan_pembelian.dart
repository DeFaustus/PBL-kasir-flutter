import 'package:flutter/material.dart';

class LaporanPembelian extends StatelessWidget {
  const LaporanPembelian({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan Pembelian"),
      ),
      body: Text("Pembelian"),
    );
  }
}
