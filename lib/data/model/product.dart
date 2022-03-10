import 'package:teche_commerce/enum/sold_status.dart';
import 'package:teche_commerce/data/model/brand.dart';
import 'package:teche_commerce/data/model/category.dart';

class Variant {
  late final String name;
  late final String hexColor;
  String? imgUrl;

  Variant({required this.name, required this.hexColor, this.imgUrl});

  Variant.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    hexColor = data['hexColor'];
    imgUrl = data['imgUrl'];
  }
}

class Product {
  late final String id;
  late final String name;
  late final double price;
  late final double rate;
  late final Category category;

  List<Variant>? variants;
  String? detail;
  SoldStatus? status;
  Brand? brand;
  int? buyCount;
  int? viewCount;

  Product.fromJSON(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    price = data['price'];
    detail = data['detail'];
    rate = data['rate'];

    if (data['status'] == 'in-stock') {
      status = SoldStatus.inStock;
    } else if (data['status'] == 'sold-out') {
      status = SoldStatus.soldOut;
    }
    brand = Brand.fromJSON(data['brand']);
    category = Category.fromJSON(data['category']);
    buyCount = data['buyCount'];
    viewCount = data['viewCount'];
    final List<Map<String, dynamic>> variantsData = data['variants'];
    variants =
        variantsData.map((variant) => Variant.fromJson(variant)).toList();
  }

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.detail,
    required this.rate,
    required this.category,


    this.status,
    this.brand,
    this.buyCount,
    this.viewCount,
    this.variants,
  });
}
