import 'package:flutter/material.dart';
import 'package:teche_commerce/view/main_navigator/widgets/navigation_button.dart';
import 'package:teche_commerce/view/main_navigator/widgets/padding_button.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 8,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            NavigationButton( icon: Icon(Icons.home), index: 0),
            NavigationButton(icon: Icon(Icons.favorite), index: 1),
            PaddingButton(),
            NavigationButton(icon: Icon(Icons.notifications), index: 2),
            NavigationButton(icon: Icon(Icons.account_circle), index: 3),
          ],
        ),
      ),
    );
  }
}
