import 'dart:math';


import 'package:app_lojaonline_ll/models/cart_item.dart';
import 'package:flutter/material.dart';

import 'product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  /* Remover um item da lista */
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  
  /* Remover o ultimo item da lista */
  void removeSingleItem(String productId) {
    if(!_items.containsKey(productId)) {
      return; //não faz nada
    }

    if(_items[productId]?.quantity == 1) {
      _items.remove(productId);
    } else {
      _items.update(
        productId,
        (existingItem) => CartItem(
          id: existingItem.id,
          productId: existingItem.productId,
          title: existingItem.title,
          quantity: existingItem.quantity - 1,
          price: existingItem.price,
        ),
      );
    }
    notifyListeners();
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (existingItem) => CartItem(
          id: existingItem.id,
          productId: existingItem.productId,
          title: existingItem.title,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id!,
        () => CartItem(
          id: Random().nextDouble().toString(),
          productId: product.id!,
          title: product.title!,
          quantity: 1,
          price: product.price!,
        ),
      );
    }
    notifyListeners();
  }

  /* Limpar a lista do carrinho */
  void clear() {
    _items = {};
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total = total + cartItem.price * cartItem.quantity;
     });
     return total;
  }
}
