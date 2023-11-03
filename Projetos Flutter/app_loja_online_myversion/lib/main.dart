import 'package:app_loja_online_myversion/models/cart.dart';
import 'package:app_loja_online_myversion/models/order_list.dart';
import 'package:app_loja_online_myversion/models/product_list.dart';
import 'package:app_loja_online_myversion/screens/cart_page.dart';
import 'package:app_loja_online_myversion/screens/my_home_page.dart';
import 'package:app_loja_online_myversion/screens/orders_page.dart';
import 'package:app_loja_online_myversion/screens/product_details_page.dart';
import 'package:app_loja_online_myversion/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductList(),),
        ChangeNotifierProvider(create: (context) => Cart(),),
        ChangeNotifierProvider(create: (context) => OrderList(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
        routes: {
          AppRoutes.HOME:(context) => MyHomePage(),
          AppRoutes.PRODUCTS_DETAILS:(context) => const ProductDetailPage(),
          AppRoutes.CART_PAGE:(context) => const CartPage(),
          AppRoutes.ORDERS:(context) => const OrdersPage(),

        },
      ),
    );
  }
}

