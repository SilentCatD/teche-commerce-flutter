import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/top_brands_bloc/top_branch_bloc.dart';
import 'brand_item.dart';

class BrandsList extends StatefulWidget {
  const BrandsList({Key? key}) : super(key: key);

  @override
  State<BrandsList> createState() => _BrandsListState();
}

class _BrandsListState extends State<BrandsList> {
  @override
  void initState() {
    super.initState();
    context.read<TopBrandsBloc>().add(TopBranchFetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopBrandsBloc, TopBrandsState>(
      builder: (context, state) {
        if (state is TopBrandsFetching || state is TopBrandsInitial) {
          return const Center(
            child: SizedBox(
              width: 200,
              height: 100,
              child: Center(child: CircularProgressIndicator()),
            ),
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
        return const Center(
          child: Text("Something went wrong"),
        );
      },
    );
  }
}
