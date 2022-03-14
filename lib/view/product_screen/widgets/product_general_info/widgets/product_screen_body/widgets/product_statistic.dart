import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/product_page_view_bloc/bloc/product_page_view_cubit.dart';

class ProductStatistic extends StatelessWidget {
  const ProductStatistic({
    Key? key,
    required this.viewCount,
    required this.buyCount,
    required this.rateCount,
    required this.rate,
    required this.price,
  }) : super(key: key);
  final int viewCount;
  final int buyCount;
  final int rateCount;
  final double rate;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '\$$price'.padRight(6, '0'),
          style: TextStyle(
            fontSize: 30,
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '⭐ $rate',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: (){
                    context.read<ProductPageViewCubit>().switchPage(1);
                  },
                  child: Text(
                    rateCount > 999 ? '(999+)' : '($rateCount)',
                    style:  TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      color: Colors.grey.shade700,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  viewCount > 99999 ? '👁️‍🗨️ 99999+' : '👁️‍🗨️ $viewCount',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  buyCount > 99999 ? '🛒  99999+' : '🛒 $buyCount',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
