import 'package:flutter/material.dart';
import 'package:teche_commerce/view/main_navigator/widgets/bottom_nav_bar.dart';
import 'package:teche_commerce/view/main_navigator/widgets/screen_switcher.dart';

class MainNavigator extends StatelessWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: const ScreenSwitcher(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.qr_code),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
