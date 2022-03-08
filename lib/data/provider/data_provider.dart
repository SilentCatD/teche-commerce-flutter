import 'package:teche_commerce/temp_data/top_brands.dart';

class DataProvider {
  Future<List<Map<String, dynamic>>> fetchTopBrands() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return topBrands;
  }

  Future<List<Map<String, dynamic>>> fetchHighLightProduct() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return productsByBrand;
  }
}
