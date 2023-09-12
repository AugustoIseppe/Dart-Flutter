import 'package:flutter/material.dart';

class App_ListaTarefas2 extends StatefulWidget {
  const App_ListaTarefas2({super.key});

  @override
  State<App_ListaTarefas2> createState() => _App_ListaTarefas2State();
}

class _App_ListaTarefas2State extends State<App_ListaTarefas2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.refresh))
        ],
      ),
      body: Container(child: Text('Hello World'),),
    );
  }
}