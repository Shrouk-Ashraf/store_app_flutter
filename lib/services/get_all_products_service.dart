
import 'package:store_app/helper/api.dart';

import '../models/products_model.dart';

class AllProductsService{


  Future<List<ProductsModel>> getAllProducts() async{
    List<dynamic> data = await Api().get(url: 'products/');

    List<ProductsModel> products = [];

    for (var product in data) {
      products.add(ProductsModel.fromJson(product));
    }
    return products;
  }
}