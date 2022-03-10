import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/product_bloc/bloc/product_bloc.dart';
import 'package:teche_commerce/view/product_screen/widgets/screen_elements.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);
  static const pageRoute = '/product-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductLoading || state is ProductInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductLoaded) {
          return ScreenElements(product: state.product);
        }
        return const Center(
          child: Text("Something went wrong"),
        );
      }),
    );
  }
}
