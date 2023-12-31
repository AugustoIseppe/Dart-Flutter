import 'package:app_lojaonline_ll_intermediario_http/firebase_options.dart';
import 'package:app_lojaonline_ll_intermediario_http/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'models/order_list.dart';
import 'models/product_list.dart';
import 'pages/cart_page.dart';
import 'pages/orders_page.dart';
import 'pages/product_detail_page.dart';
import 'pages/product_form_page.dart';
import 'pages/product_page.dart';
import 'pages/products_overview_page.dart';
import 'utils/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

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
        home: const AuthPage(),
        routes: {
          AppRoutes.AUTH_PAGE:(context) => const AuthPage(),
          AppRoutes.HOME:(context) => const ProductsOverviewPage(),
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

