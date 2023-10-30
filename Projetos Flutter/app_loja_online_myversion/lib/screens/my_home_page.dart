import 'package:app_loja_online_myversion/data/dummy_data.dart';
import 'package:app_loja_online_myversion/models/product.dart';
import 'package:app_loja_online_myversion/widgets/product_item.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
    final List<Product> loadedProducts = dummyProducts;
    MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nethoes"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 2/2,
            ), 
            itemCount: loadedProducts.length,
          itemBuilder: (context, index) {
            return ProductItem(product: loadedProducts[index]);
          },
          ),
      ),
    );
  }
}