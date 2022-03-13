import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/top_brands_bloc/top_branch_bloc.dart';
import 'brand_item.dart';

class BrandsList extends StatelessWidget {
  const BrandsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopBrandsBloc, TopBrandsState>(
      builder: (context, state) {
        if (state is TopBrandsFetching || state is TopBrandsInitial) {
          return  const SizedBox(
            height: BrandItem.itemHeight,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is TopBrandsFetched) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.brands
                  .map(
                    (brand) => BrandItem(
                      brand: brand,
                    ),
                  )
                  .toList(),
            ),
          );
        }
        return  const SizedBox(
          height: BrandItem.itemHeight,
          child: Center(
            child: Text("Something went wrong"),
          ),
        );
      },
    );
  }
}
