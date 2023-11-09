import 'package:app_loja_online/datas/product_data.dart';
import 'package:app_loja_online/screens/product_screen.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductData product;

  const ProductTile(this.type, this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductScreen(product),
          )
        );
      },
      child: Card(
        child: type == "grid"
            ?
            /* Exibição do produtos em Grid */
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 0.82,
                    child: Image.network(
                      product.images![0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          product.title!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "R\$ ${product.price!.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17.0),
                        )
                      ],
                    ),
                  )),
                ],
              )
            : Row(
              /* Exibição do produtos em Lista */
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Image.network(
                      product.images![0],
                      fit: BoxFit.cover,
                      height: 100.0,
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.title!,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "R\$ ${product.price!.toStringAsFixed(2)}",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 17.0),
                            )
                          ],
                        ),
                      )),
                ],
              ),
      ),
    );
  }
}
