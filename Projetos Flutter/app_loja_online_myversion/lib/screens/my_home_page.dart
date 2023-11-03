import 'package:app_loja_online_myversion/data/dummy_data.dart';
import 'package:app_loja_online_myversion/models/cart.dart';
// import 'package:app_loja_online_myversion/models/cart_item.dart';
import 'package:app_loja_online_myversion/models/product.dart';
import 'package:app_loja_online_myversion/models/product_list.dart';
import 'package:app_loja_online_myversion/utils/app_routes.dart';
import 'package:app_loja_online_myversion/widgets/app_drawer.dart';
import 'package:app_loja_online_myversion/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/badgee.dart';

enum ItemFilter {
  Favorites,
  All
}

class MyHomePage extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<ProductList>(context);
  final cart = Provider.of<Cart>(context);
  // final cartItem = Provider.of<CartItem>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Novidades", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent[100],
          elevation: 10,
          actions: [
            PopupMenuButton(
              color: Colors.white,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: ItemFilter.All,
                  child: const Text("Mostar todos"),
                  onTap: () {
                    provider.showAll();
                  },
                ),
                PopupMenuItem(
                  value: ItemFilter.Favorites,
                  child: const Text("Meus favoritos"),
                  onTap: () {
                    provider.showFavorites();
                  },
                ),
              ],
            ),
            Consumer<Cart>(
              builder: (context, value, child) => Badgee(
                value: cart.itemsCount.toString(),
                child: IconButton(onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART_PAGE);
                }, 
                icon: Icon(Icons.shopping_cart, color: Colors.white,)
                ),
              ),
            )
          ],
        ),
        body: ProductGrid(),
        drawer: AppDrawer(),
        );
  }
}
