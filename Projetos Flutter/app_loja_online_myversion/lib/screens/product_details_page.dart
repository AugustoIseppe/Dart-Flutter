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
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(product.imageUrl!, fit: BoxFit.cover,))),
            ),
            Text(product.description!, style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold
            ),),
            Text("R\$ ${product.price.toString()}", style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ),
    );
  }
}