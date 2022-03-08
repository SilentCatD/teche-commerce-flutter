import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/highlight_product_bloc/highlight_product_bloc.dart';
import 'package:teche_commerce/data/model/category.dart';
import 'package:teche_commerce/view/home_screen/widgets/highlight_product_section/widgets/category_product_section.dart';

import '../../../../data/model/product.dart';

class HighLightProductSection extends StatelessWidget {
  const HighLightProductSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightProductBloc, HighlightProductState>(
      builder: (BuildContext context, state) {
        if (state is HighlightProductLoading ||
            state is HighlightProductInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HighlightProductLoaded) {
          return Column(
            children: state.data.map((section){
              final Category category = section['category'];
              final List<Product> products = section['products'];
              return CategoryProductSection(
                category: category,
                products: products,
              );
            }).toList(),
          );
        }
        return const Center(child: Text("Something went wrong"));
      },
    );
  }
}
