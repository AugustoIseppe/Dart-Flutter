import 'package:app_lista_tarefas/repositories/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:app_lista_tarefas/widgets/tarefas_list_item.dart';
import '../models/tarefas.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController tarefaController = TextEditingController();
  final TodoRepositoy todoRepositoy = TodoRepositoy();
  List<Tarefas> tarefas = [];
  Tarefas? deletedTarefas;
  int? deletedTarefasPos;
  String? errorText;

  @override
  void initState() {
    super.initState();
    todoRepositoy.getTodoList().then((value) {
      setState(() {
        tarefas = value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Lista de Tarefas',
          ),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey[500],
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      child: Column(
                        children: [
                          const Padding(padding: EdgeInsets.all(10)),
                          const Text(
                            'Lista de Tarefas Diárias',
                            style: TextStyle(fontSize: 30),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: tarefaController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        filled: true,
                                        hintText: 'Adicione uma tarefa',
                                        labelText: 'Tarefa',
                                        errorText: errorText,
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.purpleAccent,
                                            width: 2
                                          )
                                        ),
                                      labelStyle: const TextStyle(
                                        color: Colors.purpleAccent
                                      )
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                TextButton(
                                  onPressed: () {
                                    String text = tarefaController.text;
                                    if (text.isEmpty) {
                                      setState(() {
                                        errorText = 'Informe uma tarefa';
                                      });
                                      return;
                                    }
                                    setState(() {
                                      Tarefas novaTarefa = Tarefas(
                                          title: text,
                                          dateTime: DateTime.now()
                                      );
                                      tarefas.add(novaTarefa);
                                      errorText = null;
                                    });
                                    tarefaController.clear(); //limpar campo do TextField
                                    todoRepositoy.saveTodoList(tarefas);
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.purpleAccent,
                                    fixedSize: const Size(63, 63),
                                  ),
                                  child: const Text(
                                    '+',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView(
                            shrinkWrap: true,
                            children: [
                              for (Tarefas tarefa in tarefas)
                                TarefasListTile(
                                  tarefa: tarefa,
                                  onDelete: onDelete,
                                )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Text(
                                        'Voce tem ${tarefas.length} tarefas pendentes')),
                                const SizedBox(
                                  width: 16,
                                ),
                                ElevatedButton(
                                    onPressed:showDeleteTarefasConfirmationDialog,
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.purpleAccent,
                                    ),
                                    child: const Text('Limpar Tudo')),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
    void onDelete(Tarefas tarefa) {
      deletedTarefas = tarefa;
      deletedTarefasPos = tarefas.indexOf(tarefa);
    setState(() {
      tarefas.remove(tarefa);
    });
    todoRepositoy.saveTodoList(tarefas);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(' ⱱ - Tarefa ${tarefa.title} removida com sucesso', 
      style: const TextStyle(color: Colors.white),),
      backgroundColor: Colors.green[500],
      action: SnackBarAction(
        label: 'Desfazer',
         onPressed: (){
          setState(() {
          tarefas.insert(deletedTarefasPos!, deletedTarefas!);
          });
          todoRepositoy.saveTodoList(tarefas);
         },
         textColor: Colors.red,
         ),
         duration: const Duration(seconds: 5),
      ),
      
    );
  }

  void showDeleteTarefasConfirmationDialog (){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text('Limpar tudo?'),
      content: const Text('Tem certeza que deseja remover toas as tarefas?'),
      actions: [
        FilledButton(onPressed: (){Navigator.of(context).pop();}, child: const Text('Cancelar')),
        FilledButton(onPressed: (){Navigator.of(context).pop(); deleteAllTarefas();}, child: const Text('Confirmar'))
      ],
    ),);
  }

  void deleteAllTarefas(){
    setState(() {
    tarefas.clear();
    });
    todoRepositoy.saveTodoList(tarefas);
  }

}
