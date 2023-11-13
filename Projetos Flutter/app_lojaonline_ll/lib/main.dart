import 'package:app_lojaonline_ll/models/cart.dart';
import 'package:app_lojaonline_ll/pages/product_page.dart';
import 'package:app_lojaonline_ll/pages/products_overview_page.dart';
import 'package:app_lojaonline_ll/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/order_list.dart';
import 'models/product_list.dart';
import 'pages/cart_page.dart';
import 'pages/orders_page.dart';
import 'pages/product_detail_page.dart';
import 'pages/product_form_page.dart';

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
          AppRoutes.PRODUCTS:(context) => const ProductsPage(),
          AppRoutes.PRODUCTS_FORM:(context) => const ProductFormPage(),
        },
      ),
    );
  }
}

