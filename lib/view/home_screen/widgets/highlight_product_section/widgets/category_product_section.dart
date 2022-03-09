import 'package:flutter/material.dart';
import 'package:teche_commerce/data/model/category.dart';
import 'package:teche_commerce/data/model/product.dart';
import 'package:teche_commerce/view/home_screen/widgets/highlight_product_section/widgets/products_display.dart';
import 'package:teche_commerce/view/home_screen/widgets/title_text.dart';

class CategoryProductSection extends StatelessWidget {
  const CategoryProductSection(
      {Key? key, required this.category, required this.products})
      : super(key: key);
  final Category category;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TitleText(
            text: category.name,
            onPress: () {},
          ),
          ProductsDisplay(products: products),
        ],
      ),
    );
  }
}
