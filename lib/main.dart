import 'package:flutter/material.dart';
import 'package:pbl_kasir/widgets/penjualan.dart';
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
      routes: {
        '/': (context) => const SplashScreenWidget(),
        '/penjualan': (context) => const Penjualan()
      },
    );
  }
}
