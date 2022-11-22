import 'package:flutter/material.dart';

class StokPage extends StatefulWidget {
  const StokPage({super.key});

  @override
  State<StokPage> createState() => _StokPageState();
}

class _StokPageState extends State<StokPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stok"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text("Stok"),
    );
  }
}
