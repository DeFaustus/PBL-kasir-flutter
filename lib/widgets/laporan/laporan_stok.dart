import 'package:flutter/material.dart';

class LaporanStok extends StatelessWidget {
  const LaporanStok({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan Stok"),
      ),
      body: Text("Stok"),
    );
  }
}
