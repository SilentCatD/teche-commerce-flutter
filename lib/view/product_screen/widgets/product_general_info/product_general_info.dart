import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_screen_bottom_app_bar.dart';

import '../../../../controller/product_bloc/bloc/product_info_bloc.dart';
import './widgets/product_screen_body/product_screen_body.dart';

class ProductGeneralInfo extends StatelessWidget {
  const ProductGeneralInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductInfoBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial || state is ProductLoading) {
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        if (state is ProductLoaded) {
          return Scaffold(
            body: ProductScreenBody(
              product: state.product,
            ),
            bottomNavigationBar: const ProductScreenBottomAppBar(),
          );
        } else {
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: Text("Something went wrong"),
              ),
            ),
          );
        }
      },
    );
  }
}
