// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage02 extends StatefulWidget {
  const HomePage02({super.key});

  @override
  State<HomePage02> createState() => _HomePage02State();
}

class _HomePage02State extends State<HomePage02> {
  Future<List<Map<String, dynamic>>> _getData() async {
    String url = "https://jsonplaceholder.typicode.com/comments";
    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> data = jsonDecode(response.body);
    return List<Map<String, dynamic>>.from(data);
  }

  String? nome;
  String? body;
  int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Consumo de Dados 02"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return Center(
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                        strokeWidth: 5.0,
                      ),
                    ),
                  );
                default:
                  if (snapshot.hasError) {
                    return Container();
                  } else {
                    return SingleChildScrollView(
                      child: Expanded(
                        child: SizedBox(
                          height: 700,
                          child: Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                String nome = snapshot.data![index]["name"];
                                String body = snapshot.data![index]["body"];
                                int id = snapshot.data![index]["id"];
                                return Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('ID: ${id.toString()} -  Título:${nome.toUpperCase()}',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.blueAccent[400],
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          body,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              }
            },
          ),
        ));
  }
}
