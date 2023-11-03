import 'package:app_loja_online_myversion/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Dismissible(
      onDismissed: (_) {
        // Provider.of<Cart>(context, listen: false).removeItem(cartItem.productId!);
        cart.removeItem(cartItem.productId!);
      },
      direction: DismissDirection.endToStart,
      key: ValueKey(cartItem.id),
      background: Card(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Icon(Icons.delete),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
        ),
      ),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            maxRadius: 25,
            minRadius: 25,
            backgroundColor: Colors.deepPurple[400],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Text(
                  "R\$\n${cartItem.price.toString()}",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          title: Text(cartItem.title!),
          subtitle: Text("R\$ ${cartItem.price! * cartItem.quantity!}"),
          trailing: Text(
            "${cartItem.quantity}x",
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
