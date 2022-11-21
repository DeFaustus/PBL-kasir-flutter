// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Penjualan extends StatelessWidget {
  const Penjualan({super.key});

  @override
  Widget build(BuildContext context) {
    final _cariBarang = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Penjualan",
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            TextFormField(
              controller: _cariBarang,
              decoration: InputDecoration(
                hintText: "Cari Barang ....",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              child: Container(
                width: 170,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(Icons.add, size: 100),
                    Text(
                      "Tambah Produk",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              onTap: () => print(_cariBarang.text),
            )
          ],
        ),
      ),
    );
  }
}
