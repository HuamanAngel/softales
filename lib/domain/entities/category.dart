class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  static late List<Category> DUMMY_CATEGORIES = [
    Category(id: '1', name: 'Category 1'),
    Category(id: '2', name: 'Category 2'),
    Category(id: '3', name: 'Category 3'),
    Category(id: '4', name: 'Category 4'),
    Category(id: '5', name: 'Category 5'),
    Category(id: '6', name: 'Category 6'),
    Category(id: '7', name: 'Category 7'),
    Category(id: '8', name: 'Category 8'),
    Category(id: '9', name: 'Category 9'),
    Category(id: '10', name: 'Category 10'),
  ];
}
