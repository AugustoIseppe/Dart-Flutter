import 'package:app_loja_online/tabs/home_tab.dart';
import 'package:app_loja_online/tabs/orders_tab.dart';
import 'package:app_loja_online/tabs/place_tab.dart';
import 'package:app_loja_online/tabs/products_tab.dart';
import 'package:app_loja_online/widgets/cart_button.dart';
import 'package:app_loja_online/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //controlador da PageView()
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children:  <Widget>[
        /* Scaffold -> Página inicial com as imagens */
        Scaffold(
          body: const HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton:const CartButton(),
        ),

        /* Scaffold -> Produtos */
        Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('Produtos'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: const ProductsTab(),
          floatingActionButton: const CartButton(),
        ),

        /* Scaffold -> Lojas */
        Scaffold(
          appBar: AppBar(
            title: const Text("Lojas", style: TextStyle(color: Colors.white),),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
          ),
          body: const PlacesTab(),
          drawer: CustomDrawer(_pageController),
        ),

        /* Scaffold -> Meus Pedidos */
        Scaffold(
          appBar: AppBar(
            title: const Text("Meus pedidos", style: TextStyle(color: Colors.white),),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
          ),
          body: const OrdersTab(),
          drawer: CustomDrawer(_pageController),
        )

      ],
    );
  }
}