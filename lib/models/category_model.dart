class CategoryModel {
  String title;
  String assetPath;
  int id;
  CategoryModel({
    required this.title,
    required this.assetPath,
    required this.id,
  });
}

List<CategoryModel> categories = [
  CategoryModel(title: 'Villa', assetPath: 'resort.jpeg', id: 1),
  CategoryModel(title: 'chalet', assetPath: 'cottage.jpeg', id: 2),
  CategoryModel(title: 'apartments', assetPath: 'office.jpeg', id: 3),
  CategoryModel(title: 'real estant', assetPath: 'urban.jpeg', id: 4),
  CategoryModel(title: 'farms', assetPath: 'urban.jpeg', id: 5),
];
