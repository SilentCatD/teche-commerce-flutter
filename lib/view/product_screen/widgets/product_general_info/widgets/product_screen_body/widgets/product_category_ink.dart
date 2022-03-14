import 'package:flutter/material.dart';
import 'package:teche_commerce/data/model/category.dart';

class ProductCategoryInk extends StatelessWidget {
  const ProductCategoryInk({Key? key, required this.category})
      : super(key: key);
  final Category? category;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Category: ",
          style: TextStyle(fontSize: 16),
        ),
        TextButton(
          onPressed: category != null ? () {} : null,
          child: Text(
            category != null ? category!.name : "Unavailable",
            style: TextStyle(
              fontSize: 16,
              color: category != null ? Colors.blue : null,
            ),
          ),
        ),
      ],
    );
  }
}
