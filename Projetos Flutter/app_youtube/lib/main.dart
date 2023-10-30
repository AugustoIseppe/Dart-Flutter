import 'package:app_youtube/blocs/videos_bloc.dart';
import 'package:app_youtube/screens/home.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

void main() {
  
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: const MaterialApp(
      title: "FlutterTube",
      debugShowCheckedModeBanner: false,
      home: Home(),
    ), 
      blocs: [
        Bloc((i) => VideosBloc()) 
        ], 
      dependencies: []
      );
  }
}

