// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class TambahProduk extends StatelessWidget {
  const TambahProduk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Produk"),
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

Widget formBuilder(labelText, textController, TextInputType inputType) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 3,
          ),
        ),
        label: Text(labelText),
      ),
      controller: textController,
      keyboardType: inputType,
    ),
  );
}
