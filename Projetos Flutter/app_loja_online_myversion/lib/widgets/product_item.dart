import 'package:app_loja_online_myversion/models/cart.dart';
import 'package:app_loja_online_myversion/models/product.dart';
import 'package:app_loja_online_myversion/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
  final product = Provider.of<Product>(context);
  final cart = Provider.of<Cart>(context);
    return GridTile(
        header: GridTileBar(
          leading: IconButton(
            onPressed: () {
              product.toggleFavorite();
            },
            icon: Icon(product.isFavorite? Icons.favorite : Icons.favorite_border,
              color: product.isFavorite? Colors.redAccent[700] : Colors.white,
            ),
          ),
          title: Text(
            product.title!,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
          ),
          trailing: IconButton(
              onPressed: () {
                cart.addItem(product);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 20,
              )),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.PRODUCTS_DETAILS, arguments: product);
              },
              child: Image.network(
                product.imageUrl!,
                fit: BoxFit.cover,
              ),
            )));
  }
}
