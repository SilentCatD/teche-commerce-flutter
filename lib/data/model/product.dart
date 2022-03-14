import 'package:teche_commerce/data/model/brand.dart';
import 'package:teche_commerce/data/model/category.dart';
import 'package:teche_commerce/enum/sold_status.dart';

class Product {
  late final String id;
  late final String name;
  late final double price;
  late final double rateAverage;
  late final List<String> imageUrls;
  late final String details;
  late final SoldStatus status;
  late final int buyCount;
  late final int viewCount;
  late final int rateCount;
  late final List<int> rates;
  Category? category;
  Brand? brand;

  Product.fromJSON(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    price = data['price'].toDouble();
    rateAverage = data['rateAverage'];
    rateCount = data['rateCount'];
    imageUrls = data['images'];
    details = data['details'];
    rates =data['rates'];
    SoldStatus soldStatus;
    if (data['status'] == 'sold-out') {
      soldStatus = SoldStatus.soldOut;
    } else if (data['status'] == 'in-stock') {
      soldStatus = SoldStatus.inStock;
    } else {
      throw Exception("Can't fetch Sold status, check server");
    }
    status = soldStatus;
    if (data['brand'] != null) {
      brand = Brand.fromJSON(data['brand']);
    }
    if (data['category'] != null) {
      category = Category.fromJSON(data['category']);
    }
    buyCount = data['buyCount'];
    viewCount = data['viewCount'];
  }

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.rateAverage,
    required this.rateCount,
    required this.imageUrls,
    required this.details,
    required this.status,
    required this.buyCount,
    required this.viewCount,
    required this.rates,
    this.category,
    this.brand,
  });
}
