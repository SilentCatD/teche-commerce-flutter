import 'package:flutter/material.dart';

class ProductScreenBottomAppBar extends StatelessWidget {
  const ProductScreenBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        child: Container(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(10),
          height: 80,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      primary: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () {},
                    child: const SizedBox(
                        height: 45,
                        width: 45,
                        child: Center(child: Icon(Icons.favorite))),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      primary: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () {},
                    child: const SizedBox(
                      height: 55,
                      child: Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
