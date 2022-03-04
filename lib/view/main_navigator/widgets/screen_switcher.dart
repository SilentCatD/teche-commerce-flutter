import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/navigation_bloc/navigation_bloc.dart';
import 'package:teche_commerce/view/notifications_screen/notifications_screen.dart';
import 'package:teche_commerce/view/profile_screen/profile_screen.dart';
import 'package:teche_commerce/view/favorite_screen/favorite_screen.dart';
import 'package:teche_commerce/view/home_screen/home_screen.dart';

class ScreenSwitcher extends StatelessWidget {
  const ScreenSwitcher({Key? key}) : super(key: key);
  final screens = const [
    HomeScreen(),
    FavoriteScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return screens[state];
      },
    );
  }
}
