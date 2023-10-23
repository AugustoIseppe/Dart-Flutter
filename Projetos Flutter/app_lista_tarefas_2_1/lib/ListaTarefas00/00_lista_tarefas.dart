import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ListaTarefas01 extends StatefulWidget {
  const ListaTarefas01({super.key});

  @override
  State<ListaTarefas01> createState() => _ListaTarefas01State();
}

class _ListaTarefas01State extends State<ListaTarefas01> {
  List listaDeTarefas = [];
  final tarefaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _readData().then((value) {
      setState(() {
        listaDeTarefas = json.decode(value!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  
                  child: TextField(
                    
                    controller: tarefaController,
                    decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Insira uma tarefa"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: _addToDo,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0),
              itemCount: listaDeTarefas.length,
              itemBuilder: (context, index) {
                return Expanded(
                  child: CheckboxListTile(
                    title: Text(listaDeTarefas[index]["titulo"]),
                    value: listaDeTarefas[index]["ok"],
                    secondary: CircleAvatar(
                      child: Icon(listaDeTarefas[index]["ok"]
                          ? Icons.check
                          : Icons.error),
                    ),
                    onChanged: (escolhaUsuario) {
                      setState(() {
                        listaDeTarefas[index]["ok"] = escolhaUsuario;
                        _saveData();
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //1 -> criar a funçao que irá retornar o caminho para salvar dados
  Future<File> _getFile() async {
    Directory diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/data.json");
  }

  //2 -> funçao para salvar os dados
  Future<File> _saveData() async {
    String data = json.encode(listaDeTarefas);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  //3 -> funçoa para ler os dados
  Future<String?> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  void _addToDo() {
    setState(() {
      Map<String, dynamic> novaTarefa = Map();
      novaTarefa["titulo"] = tarefaController.text;
      tarefaController.text = "";
      novaTarefa["ok"] = false;
      listaDeTarefas.add(novaTarefa);
      _saveData();
    });
  }

  //MÉTODO PARA ORDERNAR A LISTA CONFORME FOR DADO O CHECKBOX
  Future<void> _refresh() async {
    await Future.delayed(
        const Duration(seconds: 1)); // espera 1s para executar a função
    setState(() {
      listaDeTarefas.sort(
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
}
