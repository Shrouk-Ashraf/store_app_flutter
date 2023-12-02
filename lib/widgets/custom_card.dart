import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/screens/update_product_screen.dart';


class CustomCard extends StatelessWidget {
   CustomCard({
    required this.product,
    super.key,
  });

  ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductScreen.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Card(
            elevation: 5,
            shadowColor: Colors.grey.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16
                    ),
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r"$""${product.price}",
                        style: TextStyle(
                            color: Colors.black
                        ),
                      ),
                      Icon(Icons.favorite,
                        color: Colors.red,),
                    ],
                  )
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 80,
            child: Image.network(
              product.images[0],
              width: 110,height: 115,),
          )
        ],
      ),
    );
  }
}