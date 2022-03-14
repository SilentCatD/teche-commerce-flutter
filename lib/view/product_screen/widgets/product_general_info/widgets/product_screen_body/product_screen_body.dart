import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../controller/product_bloc/product_info_bloc.dart';
import '../../../../../../data/model/product.dart';
import './widgets/carousel.dart';
import 'widgets/product_brand_ink.dart';
import 'widgets/product_category_ink.dart';
import './widgets/product_title.dart';
import 'widgets/product_details.dart';
import 'widgets/product_statistic.dart';
import './widgets/product_status.dart';
class ProductScreenBody extends StatelessWidget {
  const ProductScreenBody({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProductInfoBloc>().add(FetchProduct());
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
                        rate: product.rateAverage,
                        price: product.price,
                      ),
                      const Divider(
                        thickness: 3,
                      ),
                      const SizedBox(height: 20),
                      ProductStatus(status: product.status),
                      const SizedBox(height: 20),
                      ProductBrandInk(brand: product.brand,),
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
    );
  }
}
