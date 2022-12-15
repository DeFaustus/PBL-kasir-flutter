import 'package:flutter/material.dart';
import 'package:pbl_kasir/models/barang_transaksi.dart';

class listTransaksi extends StatefulWidget {
  List<BarangTransaksi> barangTransaksi;
  listTransaksi({super.key, required this.barangTransaksi});

  @override
  State<listTransaksi> createState() => _listTransaksiState();
}

class _listTransaksiState extends State<listTransaksi> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.barangTransaksi.toString());
  }
}
