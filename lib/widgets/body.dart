import 'package:flutter/material.dart';
import 'package:pbl_kasir/widgets/header_pendapatan.dart';
import 'package:pbl_kasir/widgets/menu.dart';

class BodyPage extends StatelessWidget {
  final int totalHariIni = 0;
  const BodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderPendapatan(
            pendapatan: totalHariIni,
            size: size,
          ),
          const Menu()
        ],
      ),
    );
  }
}
