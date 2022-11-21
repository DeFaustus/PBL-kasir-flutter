import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pbl_kasir/widgets/laporan/laporan.dart';
import 'package:pbl_kasir/widgets/laporan/laporan_pembelian.dart';
import 'package:pbl_kasir/widgets/laporan/laporan_penjualan.dart';
import 'package:pbl_kasir/widgets/laporan/laporan_produk.dart';
import 'package:pbl_kasir/widgets/laporan/laporan_stok.dart';
import 'package:pbl_kasir/widgets/penjualan/penjualan.dart';
import 'package:pbl_kasir/widgets/penjualan/tambah_produk.dart';
import 'package:pbl_kasir/widgets/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sir.Di',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(33, 146, 255, 1),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageTransition(
              child: const SplashScreenWidget(),
              type: PageTransitionType.bottomToTop,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/laporanproduk':
            return PageTransition(
              child: const LaporanProduk(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/laporanstok':
            return PageTransition(
              child: const LaporanStok(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/transaksipembelian':
            return PageTransition(
              child: const LaporanPembelian(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/transaksipenjualan':
            return PageTransition(
              child: const LaporanPenjualan(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/tambahproduk':
            return PageTransition(
              child: const TambahProduk(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/penjualan':
            return PageTransition(
              child: const Penjualan(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          case '/laporan':
            return PageTransition(
              child: const Laporan(),
              type: PageTransitionType.leftToRight,
              childCurrent: this,
              duration: Duration(milliseconds: 250),
            );
          default:
            return null;
        }
      },
    );
  }
}
