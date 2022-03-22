import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_screen_bottom_app_bar.dart';
import './widgets/widgets.dart';

import '../../../../controller/product_bloc/bloc/product_info_bloc.dart';
import '../../../../data/model/product.dart';

class ProductGeneralInfo extends StatelessWidget {
  const ProductGeneralInfo({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProductInfoBloc>().add(FetchProduct());
      },
      child: Scaffold(
        bottomNavigationBar: const ProductScreenBottomAppBar(),
        body: SingleChildScrollView(
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
                          rate: product.rateAverage,
                          price: product.price,
                        ),
                        const Divider(
                          thickness: 3,
                        ),
                        const SizedBox(height: 20),
                        ProductStatus(status: product.status),
                        const SizedBox(height: 20),
                        ProductBrandInk(
                          brand: product.brand,
                        ),
                        ProductCategoryInk(category: product.category),
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
      ),
    );
  }
}
