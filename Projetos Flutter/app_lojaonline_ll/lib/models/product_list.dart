
import 'package:app_lojaonline_ll/data/dummy_data.dart';
import 'package:app_lojaonline_ll/models/product.dart';
import 'package:flutter/material.dart';


class ProductList with ChangeNotifier { //ChangeNotifier -> usado no gerenciamento de estado do Provider

  //dummyProducts -> lista de produtos dentro do arquivo dummy_data.dart
  List<Product> _items = dummyProducts;
  bool _showFavorites = false;

  //Disponibilizando uma forma para aceesar a lista de produtos, pois ela está como privada
  List<Product> get items {
    if(_showFavorites) {
      return _items.where((prod) => prod.isFavorite!).toList();
    }
    return [..._items];
  } 

  void showFavorites(){
    _showFavorites = true;
    notifyListeners();
  }
  void showAll(){
    _showFavorites = false;
    notifyListeners();
  }

  void addProduct(Product product) {
    //adicionar um produto
    _items.add(product);
    //notificar as mudanças para o gerenciamento de estado
    notifyListeners();
  }
}