import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teche_commerce/view/product_screen/widgets/carousel.dart';

import '../../../data/model/product.dart';

class ScreenElements extends StatelessWidget {
  const ScreenElements({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {},
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: size.height,
            ),
            Column(
              children: [
                  Carousel(variants: product.variants),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
