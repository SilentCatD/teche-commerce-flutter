import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/product_bloc/product_bloc.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_screen_body/widgets/product_status.dart';

import './carousel.dart';
import './product_details.dart';
import './product_statistic.dart';
import './product_title.dart';
import '../../../../../data/model/product.dart';

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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitle(productName: product.name),
                      const SizedBox(height: 30),
                      ProductStatistic(
                        viewCount: product.viewCount,
                        buyCount: product.buyCount,
                        rateCount: product.rateCount,
                        rate: product.rate,
                        price: product.price,
                      ),
                      const Divider(
                        thickness: 3,
                      ),
                      const SizedBox(height: 20),
                      ProductStatus(status: product.status),
                      const SizedBox(
                        height: 30,
                      ),
                      ProductDetails(details: product.details),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
