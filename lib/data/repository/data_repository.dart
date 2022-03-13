import 'package:teche_commerce/data/model/brand.dart';
import 'package:teche_commerce/data/model/product.dart';
import 'package:teche_commerce/data/provider/data_provider.dart';

import '../model/category.dart';

class DataRepository {
  late final DataProvider dataProvider;

  DataRepository({DataProvider? dataProvider}) {
    this.dataProvider = dataProvider ?? DataProvider();
  }

  Future<List<Brand>> fetchTopBrands() async {
    try {
      final brands = await dataProvider.fetchTopBrands();
      return brands.map((data) => Brand.fromJSON(data)).toList();
    } catch (e) {
      rethrow;
    }
  }


  Future<List<Map<String, dynamic>>> fetchHighLightProducts() async {
    try {
      final products = await dataProvider.fetchHighLightProduct();
      return products.map((data) {
        final category = Category.fromJSON(data['category']);
        final List<Map<String, dynamic>> productJsonList = data['product'];
        final List<Product> products = productJsonList
            .map((productData) => Product.fromJSON(productData))
            .toList();
        return {
          "category": category,
          "products": products,
        };
      }).toList();
    } catch (e) {
      rethrow;
    }
  }
  Future<Product> fetchProduct(String id) async {
    try{
      final productData = await dataProvider.fetchProduct(id);
      return Product.fromJSON(productData);
    }catch (e){
      rethrow;
    }
  }
}
