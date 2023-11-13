import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/product.dart';
import '../utils/app_routes.dart';

class ProductGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);

    return GridTile(
      footer: GridTileBar(
        leading: IconButton(
          onPressed: () {
            product.toggleFavorite();
          },
          icon: Icon(
              product.isFavorite! ? Icons.favorite : Icons.favorite_border),
          color: Colors.red[900],
        ),
        trailing: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Produto adicionado com sucesso"),
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(label: "Desfazer", onPressed: () {
                    cart.removeSingleItem(product.id!);
                  },),
                ),
              );
              cart.addItem(product);
            },
            icon: Icon(Icons.shopping_cart)),
        backgroundColor: Colors.black87,
        title: Text(
          product.title!,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontFamily: "Lato"),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
        },
        child: Image.network(
          product.imageUrl!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
