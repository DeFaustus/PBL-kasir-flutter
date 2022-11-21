import 'package:flutter/material.dart';

import 'header_pendapatan.dart';
import 'menu.dart';

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
