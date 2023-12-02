
import 'package:store_app/helper/api.dart';

import '../models/products_model.dart';

class AllProductsService{


  Future<List<ProductsModel>> getAllProducts() async{
    List<dynamic> data = await Api().get(url: 'products/');

    List<ProductsModel> products = [];

    for (int i =0; i < data.length; i++) {
      products.add(ProductsModel.fromJson(data[i]));
    }
    return products;
  }
}