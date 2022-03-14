import 'package:flutter/material.dart';
import 'package:teche_commerce/data/model/product.dart';
import 'package:teche_commerce/view/product_screen/product_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  static const double cardHeight = 250;
  static const double cardWidth = 200;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ProductCard.cardHeight,
      width: ProductCard.cardWidth,
      child: InkWell(
        onTap: () {
         Navigator.of(context).pushNamed(ProductScreen.pageRoute, arguments: product.id);
        },
        child: Card(
          elevation: 4,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final maxHeight = constraints.maxHeight;
              final maxWidth = constraints.maxWidth;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: maxHeight * 0.7,
                      child: product.imageUrls.isNotEmpty ?
                           FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: product.imageUrls[0],
                              fit: BoxFit.cover,
                            )
                          : Container(
                              color: Colors.grey,
                            ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: maxHeight * 0.3,
                    child: Column(
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              constraints:
                                  BoxConstraints(maxWidth: maxWidth * 0.4),
                              child: Text(
                                "\$${product.price.toString().padRight(5, '0')}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Text(
                              "⭐${product.rateAverage.toString()}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
