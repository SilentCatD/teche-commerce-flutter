class Brand {
  late final String id;
  late final String name;
  String? imgUrl;
  late final int rankingPoints;

  Brand({required this.id, required this.name, this.imgUrl, required this.rankingPoints});

  Brand.fromJSON(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    imgUrl = data['imgUrl'];
    rankingPoints = data['rankingPoints'];
  }
}
