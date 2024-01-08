import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/tarefas.dart';

class TarefasListTile extends StatelessWidget {
const TarefasListTile({
    Key? key, // Correção aqui
    required this.tarefa,
    required this.onDelete,
  }) : super(key: key);


  final Tarefas tarefa;
  final Function(Tarefas) onDelete;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
          padding: const EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('dd/MM/yyyy - HH:mm').format(tarefa
                          .dateTime), //necessario importar o intl para formatar datas
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      tarefa.title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              
                TextButton(
                  onPressed: (){
                    onDelete(tarefa);
                    } ,                  
                  child: const Text('Excluir'))
                  
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
