import 'package:app_loja_online_myversion/screens/my_home_page.dart';
import 'package:app_loja_online_myversion/screens/product_details_page.dart';
import 'package:app_loja_online_myversion/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
      routes: {
        AppRoutes.HOME:(context) => MyHomePage(),
        AppRoutes.PRODUCTS_DETAILS:(context) => ProductDetailPage(),
      },
    );
  }
}

