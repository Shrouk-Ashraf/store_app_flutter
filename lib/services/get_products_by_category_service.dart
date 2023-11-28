import 'package:store_app/helper/api.dart';

import '../models/products_model.dart';



class GetProdutsByCategoryService{


  Future<List<ProductsModel>> getProductsByCategory({required String categoryId}) async{
    List<dynamic> data = await Api().get(url: 'products/?categoryId=$categoryId');

    List<ProductsModel> products = [];

    for (var product in data) {
      products.add(ProductsModel.fromJson(product));
    }
      return products;
  }


}