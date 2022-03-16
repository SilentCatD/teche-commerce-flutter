import 'package:teche_commerce/data/model/brand.dart';
import 'package:teche_commerce/data/model/comment.dart';
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
    try {
      final productData = await dataProvider.fetchProduct(id);
      return Product.fromJSON(productData);
    } catch (e) {
      rethrow;
    }
  }

  Future<Comment?> fetchOwnComment(String productId, String userId) async {
    try {
      final Map<String, dynamic>? commentData =
          await dataProvider.fetchOwnComment(productId, userId);
      if (commentData == null) {
        return null;
      }
      return Comment.fromJSON(commentData);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postComment(
      String productId, String userId, String text, int rate) async {
    try {
      await dataProvider.postComment(productId, userId, text, rate);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Comment>> fetchProductComment(
      String productId, int start, int limit) async {
    try {
      final commentsData =
          await dataProvider.fetchProductComments(productId, start, limit);
      return commentsData
          .map((commentData) => Comment.fromJSON(commentData))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
