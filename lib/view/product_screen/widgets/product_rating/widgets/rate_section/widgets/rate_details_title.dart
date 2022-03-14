import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateDetailsTile extends StatelessWidget {
  const RateDetailsTile({Key? key, required this.rates, required this.rateCount,required this.star}) : super(key: key);
  final int rates;
  final int rateCount;
  final double star;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          RatingBarIndicator(
            unratedColor: Colors.black54,
            itemCount: 5,
            itemSize: 25,
            rating: star,
            itemBuilder: (BuildContext context, int index) {
              return const Icon(
                Icons.star,
                color: Colors.amber,
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context,
                  BoxConstraints constraints) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Container(
                        height: 10,
                        color: Colors.grey,
                        width: constraints.maxWidth,
                      ),
                      Container(
                        height: 10,
                        color: Colors.black54,
                        width: constraints.maxWidth *
                            rates / rateCount,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Text(rates.toString()),
        ],
      ),
    );
  }
}
