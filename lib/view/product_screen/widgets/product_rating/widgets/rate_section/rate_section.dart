import 'package:flutter/material.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_rating/widgets/rate_section/widgets/header_info.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_rating/widgets/rate_section/widgets/rate_details_title.dart';

import '../../../../../../data/model/product.dart';

class RateSection extends StatelessWidget {
  const RateSection({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          HeaderInfo(
            rateAverage: product.rateAverage,
            rateCount: product.rateCount,
          ),
          const SizedBox(height: 20,),
          ...product.rates
              .asMap()
              .map((index, rate) => MapEntry(
              index,
              RateDetailsTile(
                rates: rate,
                rateCount: product.rateCount,
                star: index + 1,
              )))
              .values
              .toList().reversed,
        ],
      ),
    );

  }
}
