import 'dart:convert';
import 'package:app_lojaonline_ll_intermediario_http/models/cart.dart';
// import 'package:app_lojaonline_ll_intermediario_http/models/cart_item.dart';
import 'package:app_lojaonline_ll_intermediario_http/models/order.dart';
import 'package:app_lojaonline_ll_intermediario_http/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderList with ChangeNotifier {
  final List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return items.length;
  }

  /* INICIO -> Método para carregar as orders do firebase */
  /* obs -> é necessário chamar o método InitState onde for chamar este método para poder carregar os itens */
  Future<void> loadOrders() async {
    _items.clear();
    //buscando os dados do firebase
    final response =
        await http.get(Uri.parse("${Constants.ORDERS_BASE_URL}.json"));
    if (response.body == "null") return;

    //inserindo os dados do firebase na lista de produtos do app
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((orderId, orderData) {
      _items.add(Order(
        id: orderId,
        total: orderData["total"],
        date: DateTime.parse(orderData["date"]),
        products: [],
        // (orderData["products"] as List<dynamic>).map((item) {
        //   return CartItem(
        //     id: item["id"],
        //     productId: item["productId"],
        //     title: item["title"],
        //     quantity: item["quantity"],
        //     price: item["price"],
        //   );
        // }).toList()
      ));
    });
    // print(data);
    notifyListeners();
  }
  /* FIM -> Método para carregar os itens do firebase */

  /* ************************************************************* */
  Future<void> addOrder(Cart cart) async {
    final date = DateTime.now();
    final response = await http.post(
      Uri.parse("${Constants.ORDERS_BASE_URL}.json"),
      body: jsonEncode(
        {
          "total": cart.totalAmount,
          "date": date.toIso8601String(),
          "products": cart.items.values
              .map(
                (cartItem) => {
                  "id": cartItem.id,
                  "productId": cartItem.productId,
                  "title": cartItem.title,
                  "quantity": cartItem.quantity,
                  "price": cartItem.price,
                },
              )
              .toList(),
        },
      ),
    );

    final id = jsonDecode(response.body)["name"];
    _items.insert(
      0,
      Order(
        id: id,
        total: cart.totalAmount,
        products: cart.items.values.toList(),
        date: date,
      ),
    );
    notifyListeners();
  }
}
