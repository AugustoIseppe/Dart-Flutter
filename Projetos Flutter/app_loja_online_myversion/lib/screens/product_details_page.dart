import 'package:app_loja_online_myversion/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
  final Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title!),
      ),
      body: Center(
        child: Column(
          children: [
            Text(product.description!),
            Image.network(product.imageUrl!)
          ],
        ),
      ),
    );
  }
}