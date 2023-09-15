import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: Teste(),
  ));
}

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {

  final String name = 'Augusto';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello $name'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.refresh))
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Text('Hello $name'),
      ),
    );
  }
}