import 'package:flutter/material.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/screens/update_product_screen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        useMaterial3: false
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        UpdateProductScreen.id : (context) => UpdateProductScreen()
      },
      initialRoute: HomeScreen.id,
    );
  }
}
