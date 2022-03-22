import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/product_bloc/bloc/product_info_bloc.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_rating/widgets/own_comment_section/own_comment_section.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_rating/widgets/product_comment_section/product_comment_section.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_rating/widgets/rate_section/rate_section.dart';

import '../../../../data/model/product.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        context.read<ProductInfoBloc>().add(FetchProduct());
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            RateSection(
              product: product,
            ),
            const OwnCommentSection(),
            ProductCommentSection(),
          ],
        ),
      ),
    );
  }
}
