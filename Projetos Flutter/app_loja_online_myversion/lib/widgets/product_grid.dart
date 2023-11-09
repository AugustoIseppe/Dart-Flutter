import 'package:app_loja_online_myversion/models/product.dart';
import 'package:app_loja_online_myversion/models/product_list.dart';
import 'package:app_loja_online_myversion/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts = provider.items;

    return Container(
      decoration: const BoxDecoration(color: Colors.black87),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2 / 2,
          ),
          itemCount: loadedProducts.length,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: loadedProducts[index],
            child: ProductItem(),
          ),
        ),
      ),
    );
  }
}
