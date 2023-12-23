import 'dart:math';
import 'package:app_lojaonline_ll_intermediario_http/data/dummy_data.dart';
import 'package:app_lojaonline_ll_intermediario_http/models/product.dart';
import 'package:flutter/material.dart';

class ProductList with ChangeNotifier {
  //ChangeNotifier -> usado no gerenciamento de estado do Provider

  //dummyProducts -> lista de produtos dentro do arquivo dummy_data.dart
  List<Product> _items = dummyProducts;
  bool _showFavorites = false;

  //Disponibilizando uma forma para aceesar a lista de produtos, pois ela está como privada
  List<Product> get items {
    if (_showFavorites) {
      return _items.where((prod) => prod.isFavorite!).toList();
    }
    return [..._items];
  }

  void showFavorites() {
    _showFavorites = true;
    notifyListeners();
  }

  void showAll() {
    _showFavorites = false;
    notifyListeners();
  }

  int get itemsCount {
    return _items.length;
  }

  void addProduct(Product product) {
    //adicionar um produto
    _items.add(product);
    //notificar as mudanças para o gerenciamento de estado
    notifyListeners();
  }

  void saveProduct(Map<String, Object> data) {
    bool hasId = data["id"] != null;
    //adicionar um produto
    final product = Product(
      id: hasId ? data["id"] as String : Random().nextDouble().toString(),
      title: data["name"] as String,
      description: data["description"] as String,
      price: data["price"] as double,
      imageUrl: data["urlImage"] as String,
    );

    if (hasId) {
      updateProduct(product);
    } else {
      addProduct(product);
    }

    //notificar as mudanças para o gerenciamento de estado
  }

  void updateProduct(Product product) {
    int index = _items.indexWhere((element) => element.id == product.id);
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void removeProduct(Product product) {
    int index = _items.indexWhere((element) => element.id == product.id);
    if (index >= 0) {
      _items.removeWhere((element) => element.id == product.id);
      notifyListeners();
    }
  }
}
