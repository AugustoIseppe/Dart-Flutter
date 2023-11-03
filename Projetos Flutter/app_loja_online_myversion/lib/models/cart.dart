import 'dart:math';

import 'package:app_loja_online_myversion/models/cart_item.dart';
import 'package:app_loja_online_myversion/models/product.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
   return _items.length;
  } 

  double get totalAmount{
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price! * cartItem.quantity!;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (itemExistente) => CartItem(
            id: itemExistente.id,
            productId: itemExistente.productId,
            title: itemExistente.title,
            quantity: itemExistente.quantity! + 1,
            price: itemExistente.price),
      );
    } else {
      _items.putIfAbsent(
        product.id!,
        () => CartItem(
          id: Random().nextDouble().toString(),
          productId: product.id,
          title: product.title,
          quantity: 1,
          price: product.price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
