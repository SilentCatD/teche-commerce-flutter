import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/product_bloc/product_info_bloc.dart';
import 'package:teche_commerce/controller/product_comment_bloc/product_comment_bloc.dart';
import 'package:teche_commerce/data/repository/data_repository.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_rating/widgets/product_comment_section/widgets/product_comments.dart';

class ProductCommentSection extends StatelessWidget {
  const ProductCommentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductInfoBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading || state is ProductInitial) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is ProductLoaded) {
          return BlocProvider(
            create: (context) => ProductCommentBloc(
                dataRepository: context.read<DataRepository>(),
                productId: state.product.id)..add(ProductCommentFetch()),
            child: const ProductComments(),
          );
        }
        return const SizedBox(
          height: 300,
          child: Center(
            child: Text("Something went wrong"),
          ),
        );
      },
    );
  }
}
