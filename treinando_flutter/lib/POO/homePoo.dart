// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:treinando_flutter/POO/usuario.dart';

class HomePoo extends StatefulWidget {
  const HomePoo({super.key});

  @override
  State<HomePoo> createState() => _HomePooState();
}

class _HomePooState extends State<HomePoo> {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  String nomeUsuario = '';
  String emailUsuario = '';

  _getData() {

    String nome = controllerNome.text;
    String email = controllerEmail.text;
    Usuario usuario = Usuario(
      nome: nome,
      email: email
      );

      setState(() {
        nomeUsuario = usuario.nome!;
        emailUsuario = usuario.email!;
      });
    print('nome:' + usuario.nome!);
    print('email:' + usuario.email!);
    _clearFields();
  }

  _clearFields() {
    controllerNome.text = '';
    controllerEmail.text = '';
  }

  _clearScreen() {
    setState(() {
      nomeUsuario = '';
      emailUsuario = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orientação a Objetos',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        actions: [
          IconButton(onPressed: _clearScreen, icon: const Icon(Icons.refresh, color: Colors.black,))
        ],
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: controllerNome,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: controllerEmail,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
              TextButton(
                onPressed: _getData,
                style: TextButton.styleFrom(backgroundColor: Colors.cyan),
                child: const Text(
                  'Recuperar Dados',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Text('Nome : ' + nomeUsuario),
              Text('Email : ' + emailUsuario),
              
            ],
          ),
        ),
      ),
    );
  }
}
