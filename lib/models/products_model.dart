
import 'dart:convert';

import 'package:store_app/models/category_model.dart';

class ProductsModel{
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final String createdAt;
  final String updatedAt;
  final CategoryModel category;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.category
});

  factory ProductsModel.fromJson(jsonData){
    return ProductsModel(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        images: jsonData['images'],
        createdAt: jsonData['creationAt'],
        updatedAt: jsonData['updatedAt'],
        category: CategoryModel.fromJson(jsonData['category'])
    );
  }


}