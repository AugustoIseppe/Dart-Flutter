import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Página Inicial", style: TextStyle(fontWeight: FontWeight.w900),),
        centerTitle: true,
        backgroundColor: Colors.indigo[600],
      ),
    );
  }
}