import 'package:teche_commerce/temp_data/data.dart';

class DataProvider {
  Future<List<Map<String, dynamic>>> fetchTopBrands() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return topBrands;
  }

  Future<List<Map<String, dynamic>>> fetchHighLightProduct() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return productsByBrand;
  }

  Future<Map<String, dynamic>> fetchProduct(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return tempProduct;
  }

  Future<Map<String, dynamic>?> fetchOwnComment(String productId, String userId) async{
    await Future.delayed(const Duration(milliseconds: 500));
    return comment;
    return null; // this mean user have not comment
  }

  Future<void> postComment(String productId, String userId, String text, int rate) async{
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<List<Map<String, dynamic>>> fetchProductComments(String productId, int start, int limit) async{
    await Future.delayed(const Duration(milliseconds: 400));
    final result = <Map<String, dynamic>>[];
    for(var i = 0; i < limit; i++){
      result.add(comment);
    }
    return result;
  }

}
