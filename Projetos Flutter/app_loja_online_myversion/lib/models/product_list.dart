import 'package:app_loja_online_myversion/data/dummy_data.dart';
import 'package:app_loja_online_myversion/models/product.dart';
import 'package:flutter/material.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  bool _showFavorites = false;

//dummyProducts -> lista de produtos dentro do arquivo dummy_data.dart
  List<Product> get items {
    if (_showFavorites) {
      return _items.where((product) => product.isFavorite).toList();
    } else {
      return [..._items];
    }
  }

  void showFavorites() {
    _showFavorites = true;
    notifyListeners();
  }

  void showAll(){
    _showFavorites = false;
    notifyListeners();
  }
}
