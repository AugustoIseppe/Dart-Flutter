import 'package:app_loja_online/datas/cart_product.dart';
import 'package:app_loja_online/datas/product_data.dart';
import 'package:app_loja_online/models/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final CartProduct cartProduct;
  CartTile(this.cartProduct);

  @override
  Widget build(BuildContext context) {
    Widget _buildContent() {
      CartModel.of(context).updatePrices();
      return Row(
        children: [
          Container(
            width: 120,
            child: Image.network(
              cartProduct.productData!.images![0],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  cartProduct.productData!.title!,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  cartProduct.size!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "R\$ ${cartProduct.productData!.price}",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: cartProduct.quantity! > 1
                          ? () {
                              CartModel.of(context).decrementProduct(cartProduct);
                            }
                          : null,
                      icon: Icon(
                        Icons.remove,
                        color: cartProduct.quantity! == 1 ? Colors.grey : Colors.red,
                      ),
                    ),
                    Text(cartProduct.quantity.toString()),
                    IconButton(
                      onPressed: () {
                        CartModel.of(context).incrementProduct(cartProduct);
                      },
                      icon: const Icon(Icons.add, color: Colors.greenAccent,),
                    ),
                    TextButton(
                      onPressed: () {
                        CartModel.of(context).removeCartItem(cartProduct);
                      },
                      child: const Text(
                        'Remover',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
        ],
      );
    }

    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: cartProduct.productData == null
            ? FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection("products")
                    .doc(cartProduct.category)
                    .collection("items")
                    .doc(cartProduct.pid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    cartProduct.productData =
                        ProductData.fromDocument(snapshot.data!);
                    return _buildContent();
                  } else {
                    return Container(
                      height: 70,
                      child: CircularProgressIndicator(),
                      alignment: Alignment.center,
                    );
                  }
                },
              )
            : _buildContent());
  }
}
