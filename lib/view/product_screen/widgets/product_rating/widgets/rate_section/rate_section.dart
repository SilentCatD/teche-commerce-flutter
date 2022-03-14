import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:teche_commerce/controller/product_bloc/product_info_bloc.dart';

class RateSection extends StatelessWidget {
  const RateSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ProductInfoBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading || state is ProductInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductLoaded) {
          return Stack(
            children: [
              Container(
                height: size.height * 0.5,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.product.rateAverage.toString(),
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
                              rating: state.product.rateAverage,
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
                              child: Text('${state.product.rateCount} rated'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Row(
                      children: [
                        RatingBarIndicator(
                          unratedColor: Colors.black54,
                          itemCount: 5,
                          itemSize: 25,
                          rating: 5,
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
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
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
                                                state.product.rates[0] /
                                                state.product.rateCount,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(state.product.rates[0].toString()),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        } else {
          return const Center(
            child: Text("Something went wrong"),
          );
        }
      },
    );
  }
}
