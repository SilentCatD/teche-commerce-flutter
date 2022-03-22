import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/controller/carousel_indicator_bloc/carousel_indicator_bloc.dart';
import 'package:teche_commerce/view/carousel_screen/carousel_screen.dart';

import 'carousel_indicator.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key, required this.imageUrls}) : super(key: key);

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CarouselIndicatorCubit>(
      create: (context) => CarouselIndicatorCubit(),
      child: CarouselView(
        imageUrls: imageUrls,
      ),
    );
  }
}

class CarouselView extends StatefulWidget {
  const CarouselView({Key? key, required this.imageUrls}) : super(key: key);
  final List<String> imageUrls;

  @override
  State<CarouselView> createState() => _CarouselState();
}

class _CarouselState extends State<CarouselView> {
  final _controller = CarouselController();
  final List<CarouselIndicator> _indicators = [];

  @override
  void initState() {
    super.initState();
    if (widget.imageUrls.isNotEmpty) {
      for (int i = 0; i < widget.imageUrls.length; i++) {
        _indicators.add(CarouselIndicator(index: i));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.imageUrls.isNotEmpty
        ? Column(
            children: [
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.3 - 20,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      context
                          .read<CarouselIndicatorCubit>()
                          .changeCarousel(index);
                    }),
                items: widget.imageUrls
                    .asMap()
                    .map((index, imageUrl) {
                      return MapEntry(
                          index,
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => CarouselScreen(
                                          imageUrls: widget.imageUrls,
                                          startIndex: index,
                                        )),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ));
                    })
                    .values
                    .toList(),
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
