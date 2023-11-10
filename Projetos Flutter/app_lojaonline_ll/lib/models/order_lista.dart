import 'dart:math';
import 'package:app_lojaonline_ll/models/cart.dart';
import 'package:app_lojaonline_ll/models/order.dart';
import 'package:flutter/material.dart';

class OrderList with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return items.length;
  }

  void addOrder(Cart cart){
    _items.insert(0, Order(
      id: Random().nextDouble().toString(), 
      total: cart.totalAmount, 
      products: cart.items.values.toList(), 
      date: DateTime.now(),
      ),
      );
      notifyListeners();
  }
} 