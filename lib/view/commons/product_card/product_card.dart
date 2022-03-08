import 'package:flutter/material.dart';
import 'package:teche_commerce/data/model/product.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width * 0.5,
      constraints: const BoxConstraints(maxWidth: 200),
      child: InkWell(
        onTap: (){},
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
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: product.variants[0].imgUrl!,
                        fit: BoxFit.fill,
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
                              "⭐${product.rate.toString()}",
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
