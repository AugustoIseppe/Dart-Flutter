import 'package:app_loja_online2/models/cart.dart';
import 'package:app_loja_online2/models/product_list.dart';
import 'package:app_loja_online2/utils/app_routes.dart';
import 'package:app_loja_online2/widgets/app_drawer.dart';
import 'package:app_loja_online2/widgets/badgee.dart';
import 'package:app_loja_online2/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  favorite,
  all,
  myCart,
}

class ProductsOverviewPage extends StatelessWidget {
  ProductsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    /* PÁGINA ONDE A LISTA DE PRODUTOS É EXIBIDA */
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Minha Loja",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          PopupMenuButton(
            color: Colors.white,
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.favorite) {
                provider.showFavorites();
              } else {
                provider.showAll();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Mostrar todos"),
                value: FilterOptions.all,
              ),
              const PopupMenuItem(
                child: Text("Meus Favoritos"),
                value: FilterOptions.favorite,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (context, cart, child) => Badgee(
              value: cart.itemCount.toString(),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART);
                },
                icon: Icon(Icons.shopping_cart, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      /* Widget ProductGrid -> onde é exibido os detalhes dos produtos */
      body: ProductGrid(),
      drawer: AppDrawer(),
    );
  }
}
