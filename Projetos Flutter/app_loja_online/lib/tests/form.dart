import 'package:app_loja_online/tests/form_model.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teste"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'email'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _nomeController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'nome'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _telefoneController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'telefone'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _senhaController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'senha'),
              ),
              const SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey
                ),
                onPressed: () {
                  Map<String, dynamic> dadosUsuario = {
                    "email": _emailController.text,
                    "nome": _nomeController.text,
                    "telefone": _telefoneController.text,
                    "senha": _senhaController.text,
                  };
                  FormModel formModel = FormModel();
                  formModel.salvarDadosNoFirebase(dadosUsuario);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.text_format, color: Colors.black,),
                    SizedBox(height: 10, width: 10,),
                    Text("Salvar dados no Firebase", style: TextStyle(color: Colors.black),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
