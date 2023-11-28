
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/category_model.dart';


class AllCategoriesService{


  Future<List<CategoryModel>> getAllCategories() async{
    List<dynamic> data = await Api().get(url: 'categories/');

    List<CategoryModel> categories = [];

    for (var category in data) {
        categories.add(CategoryModel.fromJson(category));
      }
      return categories;

  }
}