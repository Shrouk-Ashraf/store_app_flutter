import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_form_field.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({Key? key,  this.productId}) : super(key: key);

  static String id = 'update product';
  int? productId;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, desc;
  List<dynamic>? image ;

  int? price;

  TextEditingController? controller ;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductsModel product = ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar:  AppBar(
          title: Text('Update Product',
            style: TextStyle(
              color: Colors.black
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100,),
                CustomTextFormField(
                  // textController: TextEditingController(text: product.title),
                  onChanged: (data){
                    productName =data;
                  },
                    labelText: "Product name"),
                SizedBox(height: 10,),
                CustomTextFormField(
                    // textController: TextEditingController(text: product.description),
                    onChanged: (data){
                      desc =data;
                    },
                    labelText: "Product description"),
                SizedBox(height: 10,),
                CustomTextFormField(
                    // textController: TextEditingController(text: product.price.toString()),
                  textInputType: TextInputType.number,
                    onChanged: (data){
                      price =int.parse(data);
                    },
                    labelText: "Product price"),
                SizedBox(height: 10,),
                CustomTextFormField(
                    // textController: TextEditingController(text: product.images[0]),
                    onChanged: (data){

                      image![0]= data;
                    },
                    labelText: "Product image"),
                SizedBox(height: 50,),
                CustomButton(
                    buttonText: "Update",
                  onTap: ()async{
                      setState(() {
                        isLoading = true;
                      });
                      await updateProduct(product);
                      setState(() {
                        isLoading =false;
                      });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductsModel product) async{
    try {
     await  UpdateProductService().updateProduct(
          productId: product.id.toString(),
        title: productName ?? product.title,
        description: desc?? product.description ,
        price:  price== null ? product.price.toString() :price.toString(),
        images: image?? product.images,
        categoryId:  product.category.id.toString()
      );
      Navigator.pop(context,);
    }catch (e) {
      print(e.toString());
    }
  }
}
