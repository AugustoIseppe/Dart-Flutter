import 'package:app_testes/RequicoesHttp/models/users.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  Users? _userData;
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _profissaoController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _imagemUrlController = TextEditingController();


  void _validation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _userData = Users(
        nome: _nomeController.text,
        profissao: _profissaoController.text,
        idade: _idadeController.text,
        imagemUrl: _imagemUrlController.text,
      );
      _formData["nome"] = _userData!.nome;
      _formData["profissao"] = _userData!.profissao;
      _formData["idade"] = _userData!.idade;
      _formData["imagemUrl"] = _userData!.imagemUrl;
      print(_formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Usuário"),
        actions: [
          IconButton(onPressed: _validation, icon: const Icon(Icons.save))
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextFormField(
                onSaved: (nome) => _nomeController.text = nome!,
                controller: _nomeController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Nome"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (profissao) => _profissaoController.text = profissao!,
                controller: _profissaoController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Profissão"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (idade) => _idadeController.text = idade!,
                controller: _idadeController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Idade"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (imagemUrl) => _imagemUrlController.text = imagemUrl!,
                controller: _imagemUrlController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Link da imagem"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
