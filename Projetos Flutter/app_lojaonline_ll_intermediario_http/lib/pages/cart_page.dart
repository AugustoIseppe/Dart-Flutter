// import 'package:app_loja_online2/models/cart_item.dart';
import 'package:app_lojaonline_ll_intermediario_http/models/cart.dart';
import 'package:app_lojaonline_ll_intermediario_http/models/order_list.dart';
import 'package:app_lojaonline_ll_intermediario_http/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meu Carrinho",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor:
            Colors.white, //foregroundColor -> cor da seta de voltar
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CartItemWidget(cartItem: items.elementAt(index),);
                },
              ),
              ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total:",
                      style: TextStyle(fontSize: 20),
                    ),
                    Chip(
                      label: Text(
                        "R\$ ${cart.totalAmount.toStringAsFixed(2)}",
                        style: const TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Colors.grey[400],
                    ),
                    TextButton(
                      onPressed: cart.itemCount == 0 ? null : () {
                        Provider.of<OrderList>(context, listen: false).addOrder(cart);
                        cart.clear();
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: cart.itemCount == 0 ? Colors.deepOrange[100] : Colors.deepOrange),
                      child: const Text(
                        "Comprar",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
