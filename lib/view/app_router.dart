import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/navigation_bloc/navigation_bloc.dart';
import 'package:teche_commerce/controller/product_bloc/bloc/product_bloc.dart';
import 'package:teche_commerce/data/provider/data_provider.dart';
import 'package:teche_commerce/data/repository/data_repository.dart';
import 'package:teche_commerce/view/main_navigator/main_navigator.dart';
import 'package:teche_commerce/view/product_screen/product_screen.dart';

class AppRouter {
  late final NavigationCubit _navigationCubit;
  late final DataProvider _dataProvider;
  late final DataRepository _dataRepository;
  late final ProductBloc _productBloc;

  AppRouter() {
    _navigationCubit = NavigationCubit();
    _dataProvider = DataProvider();
    _dataRepository = DataRepository(dataProvider: _dataProvider);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => _dataRepository,
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: _navigationCubit),
              ],
              child: const MainNavigator(),
            ),
          ),
        );
      case ProductScreen.pageRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductBloc(dataRepository: _dataRepository, productId: settings.arguments! as String)
              ..add(FetchProduct()),
            child: const ProductScreen(),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _navigationCubit.close();
  }
}
