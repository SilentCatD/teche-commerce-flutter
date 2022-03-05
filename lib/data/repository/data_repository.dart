import 'package:teche_commerce/data/model/brand.dart';
import 'package:teche_commerce/data/provider/data_provider.dart';

class DataRepository {
  late final DataProvider dataProvider;

  DataRepository({DataProvider? dataProvider}) {
    this.dataProvider = dataProvider ?? DataProvider();
  }

  Future<List<Brand>> fetchTopBrands() async {
    try {
      final data = await dataProvider.fetchTopBrands();
      return data
          .map((brand) => Brand(
              id: brand['id'], name: brand['name'], imgUrl: brand['imgUrl']))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
