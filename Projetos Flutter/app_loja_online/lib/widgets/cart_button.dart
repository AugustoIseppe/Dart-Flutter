import 'package:app_loja_online/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class CartButton extends StatefulWidget {
  const CartButton({super.key});

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CartScreen(),
          ),
        );
      },
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(
        Icons.shopping_cart,
        color: Colors.white,
      )
    );
  }
}
