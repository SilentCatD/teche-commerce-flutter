import 'package:flutter/material.dart';

import '../../../commons/cart_button/cart_button.dart';
import '../search_bar.dart';

class AppBarWithSearchBox extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarWithSearchBox({Key? key, required this.appBar}) : super(key: key);
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const SearchBar(),
      actions: const [
        CartButton(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
