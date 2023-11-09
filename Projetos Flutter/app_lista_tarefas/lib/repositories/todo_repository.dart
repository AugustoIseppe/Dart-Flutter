import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_lista_tarefas/models/tarefas.dart';
import 'dart:convert';

const todoListKey = 'todo_list';

class TodoRepositoy {


  late SharedPreferences sharedPreferences;

  Future<List<Tarefas>> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todoListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Tarefas.fromJson(e)).toList();
  }

  void saveTodoList (List <Tarefas> tarefas){
    final jsonString =json.encode(tarefas); //transforma a lista de tarefas em um texto (padrao JSON)
    sharedPreferences.setString('todo_list', jsonString);
  }
}