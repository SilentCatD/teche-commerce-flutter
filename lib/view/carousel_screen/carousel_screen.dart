import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen(
      {Key? key, required this.imageUrls, required this.startIndex})
      : super(key: key);
  final List<String> imageUrls;
  final int startIndex;

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _carouselController.onReady
        .then((_) => _carouselController.jumpToPage(widget.startIndex));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
          ),
          items: widget.imageUrls.map((imageUrl) {
            return Image.network(
              imageUrl,
              fit: BoxFit.contain,
              height: height,
            );
          }).toList(),
        ),
      ),
    );
  }
}
