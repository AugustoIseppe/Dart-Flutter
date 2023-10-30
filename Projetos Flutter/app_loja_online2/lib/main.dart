import 'package:app_loja_online2/models/cart.dart';
import 'package:app_loja_online2/models/order_lista.dart';
import 'package:app_loja_online2/models/product_list.dart';
import 'package:app_loja_online2/pages/cart_page.dart';
import 'package:app_loja_online2/pages/orders_page.dart';
import 'package:app_loja_online2/pages/product_detail_page.dart';
import 'package:app_loja_online2/pages/products_overview_page.dart';
import 'package:app_loja_online2/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart(),),
        ChangeNotifierProvider(create: (context) => ProductList(),),
        ChangeNotifierProvider(create: (context) => OrderList(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          primaryColor: Colors.pink,
        ),
        home: ProductsOverviewPage(),
        routes: {
          AppRoutes.HOME:(context) => ProductsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL:(context) => const ProductDetailPage(),
          AppRoutes.CART:(context) => const CartPage(),
          AppRoutes.ORDERS:(context) => const OrdersPage(),
        },
      ),
    );
  }
}

