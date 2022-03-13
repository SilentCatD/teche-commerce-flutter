import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: () {},
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            Icons.add_shopping_cart,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
