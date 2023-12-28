import 'package:app_lojaonline_ll_intermediario_http/models/product.dart';
import 'package:app_lojaonline_ll_intermediario_http/models/product_list.dart';
import 'package:app_lojaonline_ll_intermediario_http/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl!),
      ),
      title: Text(product.title!),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.PRODUCTS_FORM, arguments: product);
              },
              icon: Icon(
                Icons.edit,
                color: Colors.yellow[600],
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Excluir Produto"),
                    content: const Text("Deseja realmente exluir o produto?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Provider.of<ProductList>(context, listen: false)
                                .removeProduct(product);
                            Navigator.of(context).pop();
                          },
                          child: const Text("Sim")),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Não"),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
