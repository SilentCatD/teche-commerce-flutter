import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/carousel_indicator_bloc/carousel_indicator_bloc.dart';
import 'package:teche_commerce/data/model/product.dart';
import 'package:teche_commerce/view/product_screen/widgets/carousel_indicator.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key, required this.variants}) : super(key: key);

  final List<Variant>? variants;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CarouselIndicatorCubit>(
      create: (context) => CarouselIndicatorCubit(),
      child: CarouselView(variants: variants),
    );
  }
}

class CarouselView extends StatefulWidget {
  const CarouselView({Key? key, required this.variants}) : super(key: key);
  final List<Variant>? variants;

  @override
  State<CarouselView> createState() => _CarouselState();
}

class _CarouselState extends State<CarouselView> {
  final _controller = CarouselController();
  final List<CarouselIndicator> _indicators = [];

  @override
  void initState() {
    super.initState();
    if (widget.variants != null) {
      for (int i = 0; i < widget.variants!.length; i++) {
        _indicators.add(CarouselIndicator(index: i));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.variants != null
        ? Column(
            children: [
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      context
                          .read<CarouselIndicatorCubit>()
                          .changeCarousel(index);
                    }),
                items: widget.variants!.map((variant) {
                  if (variant.imgUrl != null) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        variant.imgUrl!,
                        fit: BoxFit.contain,
                      ),
                    );
                  }
                  return Container(
                    decoration: const BoxDecoration(color: Colors.grey),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _indicators,
              ),
            ],
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.3,
          );
  }
}
