import 'package:app_lojaonline_ll_intermediario_http/models/cart.dart';
import 'package:app_lojaonline_ll_intermediario_http/models/product_list.dart';
import 'package:app_lojaonline_ll_intermediario_http/utils/app_routes.dart';
import 'package:app_lojaonline_ll_intermediario_http/widgets/app_drawer.dart';
import 'package:app_lojaonline_ll_intermediario_http/widgets/badgee.dart';
import 'package:app_lojaonline_ll_intermediario_http/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  favorite,
  all,
  myCart,
}

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({super.key});

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

bool _isLoading = true;

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  /* O método initState é necessário para poder carregar os itens do firebase */

  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<ProductList>(
      context,
      listen: false,
    ).loadProducts();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ProductList>(context, listen: false)
        .loadProducts()
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    // Provider.of<Product>(context, listen: false).toggleFavorite().then((value) {
    //   setState(() {
    //     _isFavorite = true;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    /* PÁGINA ONDE A LISTA DE PRODUTOS É EXIBIDA */
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Loja Virtual",
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
                value: FilterOptions.all,
                child: Text("Mostrar todos"),
              ),
              const PopupMenuItem(
                value: FilterOptions.favorite,
                child: Text("Meus Favoritos"),
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
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      /* Widget ProductGrid -> onde é exibido os detalhes dos produtos */
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.blue[400],
                backgroundColor: Colors.blue[600],
              ),
            )
          : RefreshIndicator(
            onRefresh: () => _refreshProducts(context),
              child: const ProductGrid(),
            ),
      drawer: const AppDrawer(),
    );
  }
}
