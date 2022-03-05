import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/navigation_bloc/navigation_bloc.dart';
import 'package:teche_commerce/data/provider/data_provider.dart';
import 'package:teche_commerce/data/repository/data_repository.dart';
import 'package:teche_commerce/view/main_navigator/main_navigator.dart';

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
      default:
        return null;
    }
  }

  void dispose() {
    _navigationCubit.close();
  }
}
