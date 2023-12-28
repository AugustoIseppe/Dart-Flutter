import 'package:app_lojaonline_ll_intermediario_http/models/product_list.dart';
import 'package:app_lojaonline_ll_intermediario_http/utils/app_routes.dart';
import 'package:app_lojaonline_ll_intermediario_http/widgets/app_drawer.dart';
import 'package:app_lojaonline_ll_intermediario_http/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});


  /* método para atualizar o pagina com o deslize para baixo */
  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<ProductList>(
      context,
      listen: false,
    ).loadProducts();
  }
  /* fim -> método para atualizar o pagina com o deslize para baixo */


  @override
  Widget build(BuildContext context) {
    final ProductList productList = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciar Produtos"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PRODUCTS_FORM);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productList.itemsCount,
            itemBuilder: (context, index) => Column(
              children: [
                ProductItem(product: productList.items[index]),
                Divider(
                  color: Colors.grey[200],
                  indent: 10,
                  endIndent: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
