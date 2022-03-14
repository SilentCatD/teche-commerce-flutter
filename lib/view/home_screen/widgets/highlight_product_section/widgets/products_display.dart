import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/switch_view_bloc/switch_view_bloc.dart';
import 'package:teche_commerce/data/model/product.dart';
import 'package:teche_commerce/enum/switch_view_type.dart';

import '../../../../commons/product_card/product_card.dart';

class ProductsDisplay extends StatelessWidget {
  const ProductsDisplay({Key? key, required this.products}) : super(key: key);
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchViewCubit, SwitchViewType>(builder: (context, state){
      if (state == SwitchViewType.gridView){
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: ProductCard.cardWidth / ProductCard.cardHeight,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(product: products[index]);
          },
        );
      }
      return  SizedBox(
        height: ProductCard.cardHeight,
        child: ListView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(product: products[index]);
          },
          itemCount: products.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        ),
      );
    });
  }
}
