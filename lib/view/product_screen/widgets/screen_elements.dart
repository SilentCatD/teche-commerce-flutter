import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/product_bloc/product_bloc.dart';
import 'package:teche_commerce/view/product_screen/widgets/carousel.dart';

import '../../../data/model/product.dart';

class ScreenElements extends StatelessWidget {
  const ScreenElements({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProductBloc>().add(FetchProduct());
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: size.height,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Carousel(imageUrls: product.imageUrls),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.name),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
