
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(cartItem.productId);
      },
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: EdgeInsets.symmetric(
              horizontal: 5,
          vertical: 5
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        color: Colors.red[300],
        ),
        padding: EdgeInsets.only(right: 15),
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete,color: Colors.white, size: 40,),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.deepOrange,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: FittedBox(
                child: Text('${cartItem.price}', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
            ),
          ),
          title: Text(cartItem.title),
          subtitle: Text("R\$ ${cartItem.price * cartItem.quantity}"),
          trailing: Text("${cartItem.quantity}x"),
        ),
      ),
    );
  }
}
