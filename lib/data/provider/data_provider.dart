import 'package:teche_commerce/temp_data/top_brands.dart';

class DataProvider {
  Future<List<Map<String, dynamic>>> fetchTopBrands() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return topBrands;
  }
}
