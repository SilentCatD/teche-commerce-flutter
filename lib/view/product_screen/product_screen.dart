import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/product_page_view_bloc/bloc/product_page_view_cubit.dart';
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
          color: Theme
              .of(context)
              .colorScheme
              .secondary,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          CartButton(),
        ],
      ),
      body: BlocListener<ProductPageViewCubit, int>(
        listener: (context, state) {
            _controller.animateToPage(
                state, duration: const Duration(milliseconds: 100), curve: Curves.linear);

        },
        child: PageView(
          controller: _controller,
          onPageChanged: (index){
            context.read<ProductPageViewCubit>().switchPage(index);
          },
          children: const [
            ProductGeneralInfo(),
            ProductRating(),
          ],
        ),
      ),
    );
  }
}
