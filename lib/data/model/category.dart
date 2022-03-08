class Category {
  late final String id;
  late final String name;

  Category({required this.id, required this.name});

  Category.fromJSON(data) {
    id = data['id'];
    name = data['name'];
  }
}
