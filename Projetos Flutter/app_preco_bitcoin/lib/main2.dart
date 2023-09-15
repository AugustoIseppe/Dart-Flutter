// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;




class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  
Future<Map> getData() async {
  String urlBitcoin = "https://blockchain.info/ticker";
  http.Response response = await http.get(Uri.parse(urlBitcoin));
  return convert.jsonDecode(response.body);
}

  late double dolar;
  late double euro;
  late double real;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Valores BITCOIN'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
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
                    dolar = snapshot.data!["USD"]["buy"];
                    euro = snapshot.data!["EUR"]["buy"];
                    real = snapshot.data!["BRL"]["buy"];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Card(
                              color: Colors.white,
                              elevation: 5,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: Image.asset(
                                      'assets/images/real.jpg',
                                      width: 80,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('15m: ' +
                                            snapshot.data!["BRL"]["15m"]
                                                .toStringAsFixed(2)),
                                        Text('last: ' +
                                            snapshot.data!["BRL"]["last"]
                                                .toStringAsFixed(2)),
                                        Text('buy: ${real.toStringAsFixed(2)}'),
                                        Text('sell: ' +
                                            snapshot.data!["BRL"]["sell"]
                                                .toStringAsFixed(2)),
                                        Text('symbol: ' +
                                            snapshot.data!["BRL"]["symbol"]),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Card(
                                color: Colors.white,
                                elevation: 5,
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(200),
                                      child: Image.asset(
                                        'assets/images/dolar.jpg',
                                        width: 80,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 5),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('15m: ' +
                                              snapshot.data!["USD"]["15m"]
                                                  .toStringAsFixed(2)),
                                          Text('last: ' +
                                              snapshot.data!["USD"]["last"]
                                                  .toStringAsFixed(2)),
                                          Text('buy: ${dolar.toStringAsFixed(2)}'),
                                          Text('sell: ' +
                                              snapshot.data!["USD"]["sell"]
                                                  .toStringAsFixed(2)),
                                          Text('symbol: ' +
                                              snapshot.data!["USD"]["symbol"]),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Card(
                                color: Colors.white,
                                elevation: 5,
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(200),
                                      
                                      child: Image.asset(
                                        'assets/images/euro.jpg',
                                        width: 80,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 5),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('15m: ' +
                                              snapshot.data!["EUR"]["15m"]
                                                  .toStringAsFixed(2)),
                                          Text('last: ' +
                                              snapshot.data!["EUR"]["last"]
                                                  .toStringAsFixed(2)),
                                          Text('buy: ${euro.toStringAsFixed(2)}'),
                                          Text('sell: ' +
                                              snapshot.data!["EUR"]["sell"]
                                                  .toStringAsFixed(2)),
                                          Text('symbol: ' +
                                              snapshot.data!["EUR"]["symbol"]),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    );
                  }
              }
            }));
  }
}
