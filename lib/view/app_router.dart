import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/navigation_bloc/navigation_bloc.dart';
import 'package:teche_commerce/controller/own_comment_bloc/bloc/own_comment_bloc.dart';
import 'package:teche_commerce/controller/product_bloc/bloc/product_info_bloc.dart';
import 'package:teche_commerce/controller/product_comment_bloc/bloc/product_comment_bloc.dart';
import 'package:teche_commerce/data/provider/data_provider.dart';
import 'package:teche_commerce/data/repository/data_repository.dart';
import 'package:teche_commerce/view/main_navigator/main_navigator.dart';
import 'package:teche_commerce/view/product_screen/product_screen.dart';

class AppRouter {
  late final NavigationCubit _navigationCubit;
  late final DataProvider _dataProvider;
  late final DataRepository _dataRepository;

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
        final _productId = settings.arguments! as String;
        final _productBloc = ProductInfoBloc(
          dataRepository: _dataRepository,
          productId: _productId,
        );
        final _ownCommentBloc = OwnCommentBloc(
          dataRepository: _dataRepository,
          productId: _productId,
          productInfoBloc: _productBloc,
        );
        final _productCommentBloc = ProductCommentBloc(
          dataRepository: _dataRepository,
          productId: _productId,
          productInfoBloc: _productBloc,
        );
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => _dataRepository,
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: _productBloc..add(FetchProduct())),
                BlocProvider.value(value: _productCommentBloc),
                BlocProvider.value(value: _ownCommentBloc),
              ],
              child: const ProductScreen(),
            ),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _navigationCubit.close();
    _dataRepository.dispose();
  }
}
