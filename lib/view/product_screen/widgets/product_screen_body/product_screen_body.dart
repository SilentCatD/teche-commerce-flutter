import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controller/product_bloc/product_bloc.dart';
import 'widgets/screen_elements.dart';

class ProductScreenBody extends StatelessWidget {
  const ProductScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductLoading || state is ProductInitial) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ProductLoaded) {
        return ScreenElements(product: state.product);
      }
      return const Center(
        child: Text("Something went wrong"),
      );
    });
  }
}
