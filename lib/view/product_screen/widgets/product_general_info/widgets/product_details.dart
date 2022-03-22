import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.details}) : super(key: key);
  final String details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Details:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 10),
        Text(
          details,
          style: TextStyle(color: Colors.grey.shade600, wordSpacing: 2),
        ),
      ],
    );
  }
}
