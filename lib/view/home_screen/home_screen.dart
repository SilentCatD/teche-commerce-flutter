import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/highlight_product_bloc/highlight_product_bloc.dart';
import 'package:teche_commerce/controller/top_brands_bloc/top_branch_bloc.dart';
import 'package:teche_commerce/data/repository/data_repository.dart';
import 'package:teche_commerce/view/commons/cart_button/cart_button.dart';
import 'package:teche_commerce/view/home_screen/widgets/highlight_product_section/highlight_product_section.dart';
import 'package:teche_commerce/view/home_screen/widgets/search_bar.dart';
import 'package:teche_commerce/view/home_screen/widgets/top_brands_section/top_brands_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) =>
            TopBrandsBloc(dataRepository: context.read<DataRepository>())
              ..add(TopBrandsFetch()),
      ),
      BlocProvider(
        create: (context) =>
            HighlightProductBloc(dataRepository: context.read<DataRepository>())
              ..add(HighLightProductFetch()),
      ),
    ], child: const HomeScreenView());
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const SearchBar(),
        actions: const [
          CartButton(),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TopBrandsSection(),
                HighLightProductSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
