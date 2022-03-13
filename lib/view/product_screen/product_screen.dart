import 'package:flutter/material.dart';
import 'package:teche_commerce/view/commons/cart_button/cart_button.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_screen_body/product_screen_body.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_screen_bottom_app_bar.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);
  static const pageRoute = '/product-screen';

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
      body: const ProductScreenBody(),
      bottomNavigationBar: const ProductScreenBottomAppBar(),
    );
  }
}
