import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/navigation_bloc/bloc/navigation_cubit.dart';
import 'package:teche_commerce/view/main_navigator/main_navigator.dart';

class AppRouter {
  late final NavigationCubit _navigationCubit;

  AppRouter() {
    _navigationCubit = NavigationCubit();
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => _navigationCubit,
                  child: const MainNavigator(),
                ));
      default:
        return null;
    }
  }

  void dispose() {
    print("dispose called");
    _navigationCubit.close();
  }
}
