import '../helper/api.dart';
import '../models/products_model.dart';

class UpdateProductService{

  Future<ProductsModel> updateProduct({
    required String productId,
    required String title,
    required String price,
    required String description,
    required String categoryId,
    required List<dynamic> images
  }) async {
  Map<String,dynamic> data =await Api().put(
  url: 'products/$productId',
  body: {
    'title' :title,
    'price':price,
    'description' :description,
    'categoryId' :categoryId,
    'images' :images,
  },
  );

  return ProductsModel.fromJson(data);

}
}