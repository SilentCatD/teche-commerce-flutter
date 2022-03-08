import 'package:flutter/material.dart';
import 'package:teche_commerce/data/model/category.dart';
import 'package:teche_commerce/data/model/product.dart';
import 'package:teche_commerce/view/commons/product_card/product_card.dart';
import 'package:teche_commerce/view/home_screen/widgets/title_text.dart';

class CategoryProductSection extends StatelessWidget {
  const CategoryProductSection(
      {Key? key, required this.category, required this.products})
      : super(key: key);
  final Category category;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 0.5,
          indent: 50,
          endIndent: 50,
        ),
        TitleText(
          text: category.name,
          onPress: () {},
        ),
        // GridView.builder(
        //   physics: const NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     childAspectRatio: 200 / 250,
        //     mainAxisSpacing: 10,
        //     crossAxisSpacing: 10,
        //   ),
        //   itemCount: products.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return ProductCard(product: products[index]);
        //   },
        // ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(product: products[index]);
            },
            itemCount: products.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
