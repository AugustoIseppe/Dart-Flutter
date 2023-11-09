import 'package:app_buscador_gifs/ui/02_gif_page.dart';
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
      response = await http.get(Uri.parse(
          'https://api.giphy.com/v1/gifs/trending?api_key=eoDw4ns3SOk2jpKR4lLtQLLl3j4oeCnT&limit=20&offset=0&rating=g&bundle=messaging_non_clips'));
    } else {
      response = await http.get(Uri.parse(
          'https://api.giphy.com/v1/gifs/search?api_key=eoDw4ns3SOk2jpKR4lLtQLLl3j4oeCnT&q=$_search&limit=19&offset=$_offset&rating=g&lang=en&bundle=messaging_non_clips'));
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
              onChanged: (value) {
                setState(() {
                  _search = value;
                  _offset = 0;
                });
              },
            ),
          ),
          FutureBuilder(
              future: _getGif(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5.0,
                      ),
                    );
                  default:
                    if (snapshot.hasError)
                      return Container();
                    else
                      return _createGifTable(context, snapshot);
                }
              }),
        ],
      ),
    );
  }

  int _getCount(List data) {
    if (_search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    return Expanded(
      child: GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //numero de grids a serem exibidos
            crossAxisSpacing: 10.0, //espaçamento entre os grids,
            mainAxisSpacing: 10.0, //espaçamento entre os grids -> na vertical,
          ),
          itemCount: _getCount(snapshot.data['data']),
          // itemCount: snapshot.data["data"].toString().length,
          itemBuilder: (context, index) {
            if (_search == null || index < snapshot.data['data'].length) {
              return GestureDetector(
                child: Image.network(
                  snapshot.data["data"][index]["images"]["fixed_height"]
                      ["url"],
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => 
                  GifPage(snapshot.data["data"][index]),)
                  );
                },
              );
            } else {
              return GestureDetector(
                child: Icon(Icons.add, color: Colors.white, size: 50,),
                onTap: (){
                  setState(() {
                  _offset +=19;
                  
                  });
                },
              );
            }
          }),
    );
  }
}
