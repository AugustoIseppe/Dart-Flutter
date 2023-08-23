import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'dart:convert' as convert;
import 'package:http/http.dart';


//coordenadas pirassununga = -22.0012278478714, -47.42619858643563
String urlWeather = 'https://api.weatherbit.io/v2.0/current?lat=-22.0012278478714&lon=-47.42619858643563&key=a8ce3c44dfa74679a38ae4e2ab51ea6e&include=minutely';

void main() async {

  http.Response response = await get(Uri.parse(urlWeather));
  convert.jsonDecode(response.body);
  print(response.body);


  //
  runApp(const MaterialApp(
    home: HomeApiWeather(),
  ));
}

class HomeApiWeather extends StatefulWidget {
  const HomeApiWeather({super.key});

  @override
  State<HomeApiWeather> createState() => _HomeApiWeatherState();
}

class _HomeApiWeatherState extends State<HomeApiWeather> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Weather'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Container(
        child: const Text('Hello API Weather'),
      ),
    );
  }
}
