class CategoryModel{
  final int id;
  final String name;
  final String image;
  final String createdAt;
  final String updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
});

  factory CategoryModel.fromJson(jsonData){
    return CategoryModel(
        id: jsonData['id'],
        name: jsonData['name'],
        image: jsonData['image'],
        createdAt: jsonData['creationAt'],
        updatedAt: jsonData['updatedAt']
    );
  }
}