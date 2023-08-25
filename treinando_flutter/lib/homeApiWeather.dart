

// ignore_for_file: file_names

import 'package:flutter/material.dart';

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
      body: const Text('Hello API Weather'),
    );
  }
}