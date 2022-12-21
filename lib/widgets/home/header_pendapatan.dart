import 'package:flutter/material.dart';

class HeaderPendapatan extends StatelessWidget {
  final Size size;
  HeaderPendapatan({super.key, required this.size});
  int pendapatan = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.3,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.4 - 0.27,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 80,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Total Penjualan Hari Ini ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Rp. $pendapatan",
                    style: TextStyle(
                        fontSize: 20,
                        height: 2.5,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
