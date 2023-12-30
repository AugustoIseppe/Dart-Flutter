import 'package:app_testes/RequicoesHttp/dummyData/dummy_data.dart';
import 'package:app_testes/RequicoesHttp/models/users.dart';
import 'package:flutter/material.dart';

class UsersList with ChangeNotifier{
  List<Users> usuarios = dummyUsers;

}