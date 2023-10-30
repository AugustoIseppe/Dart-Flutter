import 'package:app_loja_online_myversion/data/dummy_data.dart';
import 'package:app_loja_online_myversion/models/product.dart';
import 'package:flutter/material.dart';

class ProductList with ChangeNotifier {

  final List<Product> _items = dummyProducts;

//dummyProducts -> lista de produtos dentro do arquivo dummy_data.dart
  List<Product> get items {
    return [..._items];
  }

}