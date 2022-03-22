import 'package:flutter/material.dart';

import '../../../../../../enum/sold_status.dart';



class ProductStatus extends StatelessWidget {
  const ProductStatus({Key? key, required this.status}) : super(key: key);
  final SoldStatus status;

  @override
  Widget build(BuildContext context) {
    return status == SoldStatus.inStock
        ? Row(
            children: const [
              Icon(
                Icons.check,
                color: Colors.green,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'In Stock',
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
            ],
          )
        : Row(
            children: const [
              Icon(
                Icons.clear,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Sold Out',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ],
          );
  }
}
