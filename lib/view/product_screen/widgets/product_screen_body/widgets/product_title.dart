import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({Key? key, required this.productName}) : super(key: key);
  final String productName;
  @override
  Widget build(BuildContext context) {
    return Text(
      productName,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
