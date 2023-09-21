// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TesteListView extends StatefulWidget {
  const TesteListView({super.key});

  @override
  State<TesteListView> createState() => _TesteListViewState();
}

class _TesteListViewState extends State<TesteListView> {
  final identificador = TextEditingController();

  late String nome;
  late String email;
  late String username;
  late String address;
  late String cidade;
  late String zipcode;

  Future<Map<String, dynamic>> _getData() async {
    String url = 'https://jsonplaceholder.typicode.com/users/1';
    http.Response response = await http.get(Uri.parse(url));
    return convert.jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('teste'),
      ),
      body: Column(
        children: [
          FutureBuilder<Map>(
              future: _getData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(
                      child: Text('Carregando dados...'),
                    );
                  default:
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          'Erro ao carregar dados :(',
                          style: TextStyle(color: Colors.amber, fontSize: 25.0),
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else {
                      nome = snapshot.data!["name"];
                      email = snapshot.data!["email"];
                      username = snapshot.data!["username"];
                      address = snapshot.data!["address"]["street"];
                      cidade = snapshot.data!["address"]["city"];
                      zipcode = snapshot.data!["address"]["zipcode"];
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Nome: ' + nome,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'Email: ' + email,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'Username: ' + username,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'Endereço: ' + address,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'Cidade: ' + cidade,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'CEP: ' + zipcode,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      );
                    }
                }
              }),
          
        ],
      ),
    );
  }
}
