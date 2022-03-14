import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({Key? key, required this.rateAverage, required this.rateCount}) : super(key: key);
  final double rateAverage;
  final int rateCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          rateAverage.toString(),
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingBarIndicator(
              rating: rateAverage,
              itemCount: 5,
              itemSize: 30,
              unratedColor: Colors.black54,
              direction: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${rateCount} rated'),
            ),
          ],
        ),
      ],
    );
  }
}
