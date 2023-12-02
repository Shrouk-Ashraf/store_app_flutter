import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class AddProductService{
  
  
  Future<ProductsModel> addProduct({
    required String title,
    required String price,
    required String description,
    required String categoryId,
    required List<String> images
  }) async {
    Map<String,dynamic> data =await Api().post(
        url: 'products/',
        body: {
          "title": title,
          "price": price,
          "description": description,
          "categoryId": categoryId,
          "images": images
        },
    );
    return ProductsModel.fromJson(data);
  }
}