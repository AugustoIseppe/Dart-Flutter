import 'package:app_lojaonline_ll/models/product_list.dart';
import 'package:app_lojaonline_ll/utils/app_routes.dart';
import 'package:app_lojaonline_ll/widgets/app_drawer.dart';
import 'package:app_lojaonline_ll/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList productList = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciar Produtos"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.PRODUCTS_FORM);
          }, 
          icon: const Icon(Icons.add))
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
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
          ),),
      ),
    );
  }
}