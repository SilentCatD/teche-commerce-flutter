import 'package:flutter/material.dart';

import '../../../../../../data/model/brand.dart';



class ProductBrandInk extends StatelessWidget {
  const ProductBrandInk({Key? key, required this.brand}) : super(key: key);
  final Brand? brand;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Brand: ",
          style: TextStyle(fontSize: 16),
        ),
        TextButton(
          onPressed: brand != null ? () {} : null,
          child: Text(
            brand != null ? brand!.name : "Unavailable",
            style: TextStyle(
              fontSize: 16,
              color: brand != null ? Colors.blue : null,
            ),
          ),
        ),
      ],
    );
  }
}
