import 'dart:convert';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  bool? isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void _toggleFavorite() {
    isFavorite = !isFavorite!;
    notifyListeners();
  }

  Future<void> toggleFavorite() async {
    _toggleFavorite();

    final response = await http.patch(
      Uri.parse("${Constants.PRODUCT_BASE_URL}/$id.json"),
      //método abaixo -> converter para JSON
      body: jsonEncode({
        "isFavorite": isFavorite,
      }),
    );

    if (response.statusCode >= 400) {
      _toggleFavorite();
    }
  }
}
