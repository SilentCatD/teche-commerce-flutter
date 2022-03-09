import 'package:flutter/material.dart';
import 'package:teche_commerce/data/model/brand.dart';
import 'package:transparent_image/transparent_image.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({Key? key, required this.brand}) : super(key: key);
  final Brand brand;
  final double itemWidth = 200;
  final double itemHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: (){
          },
          child: Stack(
            children: [
              if (brand.imgUrl != null)
                SizedBox(
                  width: itemWidth,
                  height: itemHeight,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: brand.imgUrl!,
                    fit: BoxFit.fill,
                  ),
                ),
              Container(
                width: 200,
                height: 100,
                color: Colors.black.withOpacity(0.5),
              ),
              SizedBox(
                width: 200,
                height: 100,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      brand.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).canvasColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
