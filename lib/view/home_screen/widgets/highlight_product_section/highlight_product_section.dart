import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/highlight_product_bloc/highlight_product_bloc.dart';
import 'package:teche_commerce/data/model/category.dart';
import 'package:teche_commerce/view/home_screen/widgets/highlight_product_section/widgets/category_product_section.dart';
import 'package:teche_commerce/view/home_screen/widgets/highlight_product_section/widgets/view_switch.dart';
import 'package:teche_commerce/view/home_screen/widgets/top_brands_section/top_brands_section.dart';
import 'package:teche_commerce/view/main_navigator/widgets/bottom_nav_bar.dart';

import '../../../../data/model/product.dart';

class HighLightProductSection extends StatelessWidget {
  const HighLightProductSection({Key? key, required this.appBarHeight})
      : super(key: key);
  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    final remainingHeight = MediaQuery.of(context).size.height -
        appBarHeight -
        TopBrandsSection.sectionHeight -
        BottomNavBar.bottomNavBarHeight -
        MediaQuery.of(context).viewPadding.top;
    return BlocBuilder<HighlightProductBloc, HighlightProductState>(
      builder: (BuildContext context, state) {
        if (state is HighlightProductLoading ||
            state is HighlightProductInitial) {
          return SizedBox(
            height: remainingHeight,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        if (state is HighlightProductLoaded) {
          return Column(
            children: [
              Divider(
                color: Theme.of(context).primaryColor,
                thickness: 0.5,
                indent: 50,
                endIndent: 50,
              ),
              const ViewSwitch(),
              ...state.data.map((section) {
                final Category category = section['category'];
                final List<Product> products = section['products'];
                return CategoryProductSection(
                  category: category,
                  products: products,
                );
              }).toList()
            ],
          );
        }
        return SizedBox(
            height: remainingHeight,
            child: const Center(child: Text("Something went wrong")));
      },
    );
  }
}
