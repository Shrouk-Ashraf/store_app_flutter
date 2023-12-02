import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/products_model.dart';

import '../services/get_all_products_service.dart';
import '../widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('New Trend',style: TextStyle(
          fontSize: 20,
          color: Colors.black
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(
                FontAwesomeIcons.cartShopping,
                color: Colors.black,
              ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: ()async {
          setState(() {

          });
        },
        child: FutureBuilder<List<ProductsModel>> (
          future: AllProductsService().getAllProducts(),
          builder: (context,snapshot){
            if (snapshot.hasData) {
              List<ProductsModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                  clipBehavior: Clip.none,
                  padding: EdgeInsets.only(left: 16,right: 16,bottom: 10,top: 115) ,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.9,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 110
                  ),
                  itemBuilder: (context,index){
                    return CustomCard(product: products[index],);
                  }
              );
            }else{
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      )
    );
  }
}

