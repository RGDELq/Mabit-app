class CategoryModel {
  String title;
  String assetPath;
  CategoryModel({
    required this.title,
    required this.assetPath,
  });
}

List<CategoryModel> categories = [
  CategoryModel(title: 'Villa', assetPath: 'resort.jpeg'),
  CategoryModel(title: 'Chalet', assetPath: 'cottage.jpeg'),
  CategoryModel(title: 'apartments', assetPath: 'office.jpeg'),
  CategoryModel(title: 'real estate', assetPath: 'urban.jpeg'),
  CategoryModel(title: 'villa', assetPath: 'urban.jpeg'),
];
