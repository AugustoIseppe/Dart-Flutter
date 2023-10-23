// import 'package:app_testes/LojaOnline/screens/home_screen.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: 'App Testes',
//     theme: ThemeData(
//       useMaterial3: true,
//       primaryColor: const Color.fromARGB(255, 4, 125, 141),
//     ),
//     home: PaginaInicial(),
//   ));
// }
 import 'dart:convert';

import 'package:http/http.dart' as http;

 Future main() async {
  final json = await getData();
  print(json['title']);
 }

 Future<Map> getData () async {
  var url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  return json;
 }