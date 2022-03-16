import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/product_bloc/product_info_bloc.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_rating/widgets/rate_section/widgets/header_info.dart';
import 'package:teche_commerce/view/product_screen/widgets/product_rating/widgets/rate_section/widgets/rate_details_title.dart';

class RateSection extends StatelessWidget {
  const RateSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductInfoBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading || state is ProductInitial) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ProductLoaded) {
          return Container(
            height: 300,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                HeaderInfo(
                  rateAverage: state.product.rateAverage,
                  rateCount: state.product.rateCount,
                ),
                const SizedBox(height: 20,),
                ...state.product.rates
                    .asMap()
                    .map((index, rate) => MapEntry(
                        index,
                        RateDetailsTile(
                          rates: rate,
                          rateCount: state.product.rateCount,
                          star: index + 1,
                        )))
                    .values
                    .toList().reversed,
              ],
            ),
          );
        } else {
          return const SizedBox(
            height: 300,
            child: Center(
              child: Text("Something went wrong"),
            ),
          );
        }
      },
    );
  }
}
