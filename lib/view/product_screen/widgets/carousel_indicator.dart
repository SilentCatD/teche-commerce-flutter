import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/carousel_indicator_bloc/carousel_indicator_bloc.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselIndicatorCubit, int>(
      builder: (context, state) {
        return Container(
          width: 12.0,
          height: 12.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                  .withOpacity(state == index ? 0.9 : 0.4)),
        );
      },
    );
  }
}
