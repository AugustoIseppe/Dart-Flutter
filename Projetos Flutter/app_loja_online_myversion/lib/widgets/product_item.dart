import 'package:app_loja_online_myversion/models/product.dart';
import 'package:app_loja_online_myversion/utils/app_routes.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GridTile(
        header: GridTileBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Colors.redAccent[700],
            ),
          ),
          title: Text(
            product.title!,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
          ),
          trailing: IconButton(
              onPressed: () {},
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
