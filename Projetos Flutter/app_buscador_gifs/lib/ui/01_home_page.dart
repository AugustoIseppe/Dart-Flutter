import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controllerField = TextEditingController();
  String? _search;
  int _offset = 0;

  Future<Map> _getGif() async {
    http.Response response;
    // ignore: unnecessary_null_comparison
    if (_search == null) {
      response = await http.get(Uri.parse('https://api.giphy.com/v1/gifs/trending?api_key=eoDw4ns3SOk2jpKR4lLtQLLl3j4oeCnT&limit=20&offset=0&rating=g&bundle=messaging_non_clips'));
    } else {
      response = await http.get(Uri.parse('https://api.giphy.com/v1/gifs/search?api_key=eoDw4ns3SOk2jpKR4lLtQLLl3j4oeCnT&q=$_search&limit=25&offset=$_offset&rating=g&lang=en&bundle=messaging_non_clips'));
    }
    return jsonDecode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
            'https://developers.giphy.com/branch/master/static/header-logo-0fec0225d189bc0eae27dac3e3770582.gif'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _controllerField,
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Pesquisar GIF'),
              onChanged: (value) {},
            ),
          )
        ],
      ),
    );
  }
}
