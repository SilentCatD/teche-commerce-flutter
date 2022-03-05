import 'package:flutter/material.dart';
import 'package:teche_commerce/data/model/brand.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({Key? key, required this.brand}) : super(key: key);

  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          image: brand.imgUrl != null
              ? DecorationImage(
                  opacity: 0.5,
                  image: Image.network(
                    brand.imgUrl!,
                  ).image,
                  fit: BoxFit.fill,
                )
              : null,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              brand.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
