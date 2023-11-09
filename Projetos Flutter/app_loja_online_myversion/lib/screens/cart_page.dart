// import 'package:app_loja_online_myversion/models/cart_item.dart';
import 'package:app_loja_online_myversion/models/order_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../widgets/cart_item_widget.dart';
// import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Carrinho"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => CartItemWidget(cartItem: items[index],)
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "TOTAL:",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 15),
                      ),
                      Chip(
                        backgroundColor: Colors.lightGreenAccent[700],
                        label: Text(
                          "R\$ ${cart.totalAmount.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 17,
                              color: Colors.black, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey[300],
                    height: 10,
                  ),
                  FilledButton(
                    onPressed: () {
                      Provider.of<OrderList>(context, listen: false).addOrder(cart);
                      cart.clear();
                    },
                    child: const Text(
                      "Comprar",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
