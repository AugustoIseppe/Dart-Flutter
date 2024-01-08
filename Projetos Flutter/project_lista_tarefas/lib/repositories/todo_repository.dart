import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/tarefas.dart';

const todoListKey = 'todo_list';

class TodoRepository {


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