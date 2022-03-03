import 'package:flutter/material.dart';
import 'package:teche_commerce/view/main_navigator/main_navigator.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MainNavigator());
      default:
        return null;
    }
  }

  void dispose() {
    print("dispose called");
  }
}
