import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/top_brands_bloc/bloc/top_brands_bloc.dart';
import 'package:teche_commerce/data/repository/data_repository.dart';
import 'package:teche_commerce/view/commons/cart_button/cart_button.dart';
import 'package:teche_commerce/view/home_screen/widgets/brands_list/brands_list.dart';
import 'package:teche_commerce/view/home_screen/widgets/search_bar.dart';
import 'package:teche_commerce/view/home_screen/widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopBrandsBloc(dataRepository: context.read<DataRepository>()),
      child: const HomeScreenView(),
    );
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
              children: [
                TitleText(text: "Top brands"),
                SizedBox(height: 20),
                BrandsList(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
