// ignore_for_file: camel_case_types, prefer_collection_literals

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
  //controlador para capturar o texto do TextField
  final controller = TextEditingController();

  /* MAP CRIADO PARA ARAMAZENAR O ULTIMO ITEM REMOVIDO */
  Map<String, dynamic>? _lastRemoved; //map criado para armazenar o ultimo item da lista removido
  int? _lastRemovedPos; //qual posição o item foi removido
  /* FIM MAP CRIADO PARA ARAMAZENAR O ULTIMO ITEM REMOVIDO */

  @override
  void initState() {
    super.initState();
    _readData().then((value) {
      setState(() {
        _toDoList = json.decode(value!);
      });
    });
  }

  //FUNÇÃO PARA ADD OS ITENS NA LISTA
  void _addToDo() {
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo['title'] = controller.text; //recebe o valor do controller
      controller.text = ""; //limpa o controller
      newToDo['ok'] = false; // atribiu um valor ao checkbox
      _toDoList.add(newToDo); //adiciona o novo item na lista
      _saveData(); //salva permanentemente os itens da lista
    });
  }


  //MÉTODO PARA ORDERNAR A LISTA CONFORME FOR DADO O CHECKBOX
    Future<void> _refresh() async {
    await Future.delayed(
        const Duration(seconds: 1)); // espera 1s para executar a função
    setState(() {
      _toDoList.sort(
        (a, b) {
          if (a["ok"] && !b["ok"]) {
            return 1;
          } else if (!a["ok"] && b["ok"])
            // ignore: curly_braces_in_flow_control_structures
            return -1;
          else
            // ignore: curly_braces_in_flow_control_structures
            return 0;
        },
      );
      _saveData();
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Compras',
          style: TextStyle(color: Colors.purple),
        ),
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: _refresh,
              icon: const Icon(
                Icons.refresh,
                color: Colors.purple,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  cursorColor: Colors.purple,
                  decoration: InputDecoration(
                    labelText: 'Insira uma tarefa',
                    labelStyle: const TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      fixedSize: const Size(60, 60),
                      backgroundColor: Colors.purple,
                      shape: const CircleBorder()),
                  onPressed: _addToDo,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ))
            ]),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10.0),
                itemCount: _toDoList.length,
                itemBuilder: buildItem,
              ),
            ),
          )
        ],
      ),
    );
  }

//FUNÇÃO PARA CRIAÇÃO DO LISTTILE
  Widget buildItem(BuildContext context, int index) {
    return Dismissible(
      //dismissible -> ação de deslizar para o lado e deletar o item da lista
      key: Key(DateTime.now()
          .millisecondsSinceEpoch
          .toString()), //necessario para gerar uma chave aleatoria que para que a chave nao se repita
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(_toDoList[index]["title"]),
        value: _toDoList[index]["ok"],
        secondary: CircleAvatar(
            child: Icon(_toDoList[index]['ok'] ? Icons.check : Icons.error)),
        onChanged: (value) {
          setState(() {
            _toDoList[index]['ok'] = value;
            _saveData();
          });
        },
      ),
      onDismissed: (direction) {
        setState(() {
          _lastRemoved = Map.from(_toDoList[
              index]); //map criado para armazenar o ultimo item da lista removido
          _lastRemovedPos = index;
          _toDoList.removeAt(index);
          _saveData();

          final snack = SnackBar(
            //MENSAGEM DE QUANDO REMOVER ALGUM ITEM DA LISTA
            content: Text(
                'Tarefa "${_lastRemoved!["title"]}" removida com sucesso'),
            action: SnackBarAction(
                label: "Desfazer",
                onPressed: () {
                  setState(() {
                    _toDoList.insert(_lastRemovedPos!, _lastRemoved!);
                    _saveData();
                  });
                }),
            duration: const Duration(seconds: 1),
          );
          // Scaffold.of(context).showSnackBar(snack);
          ScaffoldMessenger.of(context).showSnackBar(snack);
        });
      },
    );
  }

  //FUNCAO QUE IRÁ RETORNAR O ARQUIVO PARA SALVAR
  Future<File> _getFile() async {
    //armazenará o diretório onde os documentos do aplicativo serão armazenados
    Directory directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json"); // Esta linha cria um objeto File que representa um arquivo no sistema de arquivos.
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
