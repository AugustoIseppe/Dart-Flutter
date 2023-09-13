import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

class App_ListaTarefas2 extends StatefulWidget {
  const App_ListaTarefas2({super.key});

  @override
  State<App_ListaTarefas2> createState() => _App_ListaTarefas2State();
}

class _App_ListaTarefas2State extends State<App_ListaTarefas2> {
  //LISTA QUE IRÁ ARMAZENAR AS TAREFAS
  List _toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Lista de Tarefas',
            style: TextStyle(color: Colors.purple),
          ),
          elevation: 0.5,
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.refresh,
                  color: Colors.purple,
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(children: [
                Expanded(
                  child: TextField(
                    cursorColor: Colors.purple,
                    decoration: InputDecoration(
                      labelText: 'Insira uma tarefa',
                      labelStyle: TextStyle(color: Colors.purple),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: Size(60, 60),
                      backgroundColor: Colors.purple,
                          shape: CircleBorder()
                    ),
                    onPressed: () {},
                    child: Icon(Icons.add, color: Colors.white,))
              ]),
            )
          ],
        ));
  }

  //FUNCAO QUE IRÁ RETORNAR O ARQUIVO PARA SALVAR
  Future<File> _getFile() async {
    //armazenará o diretório onde os documentos do aplicativo serão armazenados
    final directory = await getApplicationDocumentsDirectory();
    return File(
        "${directory.path}/data.json"); // Esta linha cria um objeto File que representa um arquivo no sistema de arquivos.
  }

  //FUNCAO QUE IRÁ SALVAR OS DADOS
  Future<File> _saveData() async {
    //CONVERTER A LISTA PARA JSON
    String data = json.encode(_toDoList); //transforma a list em uma string json
    final file = await _getFile();
    return file.writeAsString(data);
  }

  //FUNCAO PARA OBTER OS DADOS
  Future<String?> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
