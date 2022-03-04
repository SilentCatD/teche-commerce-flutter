import 'package:flutter/material.dart';
import 'package:teche_commerce/controller/navigation_bloc/navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({Key? key, required this.icon, required this.index})
      : super(key: key);
  final int index;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<NavigationCubit>().changeScreen(index);
      },
      icon: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return IconTheme(
            child: icon,
            data: IconThemeData(color: state == index ? Theme
                .of(context)
                .colorScheme
                .secondary : Colors.white60),
          );
        },
      ),
    );
  }
}
