import 'package:flutter/material.dart';
import 'RequicoesHttp/pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'App Testes',
    theme: ThemeData(
      useMaterial3: true,
      primaryColor: const Color.fromARGB(255, 4, 125, 141),
    ),
    home: const HomePage(),
  ));
}