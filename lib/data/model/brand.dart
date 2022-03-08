class Brand {
  late final String id;
  late final String name;
  late final String? imgUrl;

  Brand({required this.id, required this.name, this.imgUrl});

  Brand.fromJSON(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    imgUrl = data['imgUrl'];
  }
}
