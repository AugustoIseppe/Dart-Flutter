import 'dart:convert';
import 'dart:math';
// import 'package:app_lojaonline_ll_intermediario_http/data/dummy_data.dart';
import 'package:app_lojaonline_ll_intermediario_http/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductList with ChangeNotifier {
  //ChangeNotifier -> usado no gerenciamento de estado do Provider
  final _baseUrl =
      "https://applojaonline-ll-default-rtdb.firebaseio.com/products";

  //dummyProducts -> lista de produtos dentro do arquivo dummy_data.dart
  // List<Product> _items = dummyProducts;
  final List<Product> _items = [];
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

  /* INICIO -> Método para carregar os itens do firebase */
  /* obs -> é necessário chamar o método InitState onde for chamar este método para poder carregar os itens */
  Future<void> loadProducts() async {
    _items.clear();
    //buscando os dados do firebase
    final response = await http.get(Uri.parse("$_baseUrl.json"));
    if (response.body == "null") return;

    //inserindo os dados do firebase na lista de produtos do app
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((productId, productData) {
      _items.add(
        Product(
          id: productId,
          title: productData["title"],
          description: productData["description"],
          price: productData["price"],
          imageUrl: productData["imageUrl"],
          isFavorite: productData["isFavorite"],
        ),
      );
    });
    notifyListeners();
  }
  /* FIM -> Método para carregar os itens do firebase */

  /* ************************************************************* */

  /* INICIO -> Método para adicionar um produto no firebase */
  Future<void> addProduct(Product product) async {
    /* método para add um produto no NO FIREBASE */
    final response = await http.post(
      Uri.parse("$_baseUrl.json"),
      //método abaixo -> converter para JSON
      body: jsonEncode({
        "title": product.title,
        "description": product.description,
        "price": product.price,
        "imageUrl": product.imageUrl,
        "isFavorite": product.isFavorite
      }),
    );

    final id = jsonDecode(response.body)['name'];
    /* método para add um produto na lista de produtos do app */
    //adicionar um produto
    _items.add(
      Product(
          id: id,
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
          isFavorite: product.isFavorite),
    );
    //notificar as mudanças para o gerenciamento de estado

    notifyListeners();
  }
  /* FIM -> Método para adicionar */

  /* ************************************************************* */

  /* INICIO -> MÉTODO PARA SALVAR UM PRODUTO */
  Future<void> saveProduct(Map<String, Object> data) {
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
      return updateProduct(product);
    } else {
      return addProduct(product);
    }

    //notificar as mudanças para o gerenciamento de estado
  }
  /* FIM -> Método para salvar um produto */

  /* ************************************************************* */

  /* INICIO -> Método para atualizar um produto */
  Future<void> updateProduct(Product product) async {
    int index = _items.indexWhere((element) => element.id == product.id);
    if (index >= 0) {
      await http.patch(
        Uri.parse("$_baseUrl/${product.id}.json"),
        //método abaixo -> converter para JSON
        body: jsonEncode({
          "title": product.title,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl,
        }),
      );

      /* após alterar os produtos no firebase, logo após os dados voltarem, será atualizada a lista local abaixo */
      _items[index] = product;
      notifyListeners();
    }
  }
  /* FIM -> Método para atualizar um produto */

  /* ************************************************************* */

  /* INICIO -> Método para remover um produto */
  Future<void> removeProduct(Product product) async {
    int index = _items.indexWhere((element) => element.id == product.id);
    if (index >= 0) {
      final product = _items[index];
      _items.remove(product);
      notifyListeners();
      //método abaixo -> converter para JSON
      final response = await http.delete(
        Uri.parse("$_baseUrl/${product.id}.json"),
      );

      if (response.statusCode >= 400) {
        _items.insert(index, product);
        notifyListeners();
      }
    }
  }
}
