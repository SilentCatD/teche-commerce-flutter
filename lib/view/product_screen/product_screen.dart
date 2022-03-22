import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/product_bloc/product_info_bloc.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_general_info/product_general_info.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_rating/product_rating.dart';

import '../commons/cart_button/cart_button.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  static const pageRoute = '/product-screen';

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.secondary,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          CartButton(),
        ],
      ),
      body: BlocBuilder<ProductInfoBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial || state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductLoaded) {
            return PageView(
              controller: _controller,
              children: [
                ProductGeneralInfo(
                  product: state.product,
                ),
                ProductRating(product: state.product,),
              ],
            );
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
  }
}
