import 'package:flutter/material.dart';
import 'package:projeto_uber/Routes.dart';
import 'package:projeto_uber/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projeto_uber/telas/Login.dart';

void main() async {
  //Método para inicializar o FireBase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(
    home: Login(),
    initialRoute: "/",
    onGenerateRoute: Rotas.gerarRotas,
  )); 
}
