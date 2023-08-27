// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'dart:async';
import 'package:http/http.dart' as http;

class HomeJsonPlaceholder extends StatefulWidget {
  const HomeJsonPlaceholder({super.key});

  @override
  State<HomeJsonPlaceholder> createState() => _HomeJsonPlaceholderState();
}

class _HomeJsonPlaceholderState extends State<HomeJsonPlaceholder> {
  Future<Map> getData() async {
    String url = "https://jsonplaceholder.typicode.com/photos/2";
    http.Response response = await http.get(Uri.parse(url));
    return convert.jsonDecode(response.body);
  }

  late String title;
  late String img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'JsonPlaceholder',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
          ],
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                    child: Text(
                      'Carregando Dados...',
                      style: TextStyle(color: Colors.green, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
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
                    title = snapshot.data!["title"];
                    img = snapshot.data!["thumbnailUrl"];
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Expanded(
                              child: Image.network(img))),
                        ],
                      ),
                    );
                  }
              }
            }));
  }
}
