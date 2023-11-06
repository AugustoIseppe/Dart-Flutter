// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:projeto_uber/Model/Usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  bool _tipoUsuario = false; //false = passageiro *** true = motorista
  String _mensagemErro = "";

  _validarCampos() {
    //1º -> recuperar os dados do usuario através do input
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    //2º -> verificar se os campos nao estao vazios (validar campos)
    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains('@')) {
        if (senha.isNotEmpty && senha.length >= 6) {
          //ao entrar dentro desse ultimo if, quer dizer que já pode salvar os dados do usuario
          //olhar a classe Usuario criada em Usuario.dart
          Usuario usuario = Usuario();
          usuario.nome = nome;
          usuario.email = email;
          usuario.senha = senha;
          usuario.tipoUsuario = usuario.verificarTipoUsuario(_tipoUsuario);

          //CADASTRAR O USUARIO
          _cadastrarUsuario(usuario);

        } else {
          setState(() {
            _mensagemErro = "Digite uma senha com no minimo 6 caracteres";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Informe seu e-mail";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Digite seu nome";
      });
    }
  }

  _cadastrarUsuario(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;
    
    auth.createUserWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha
    // ignore: avoid_types_as_parameter_names
    ).then((UserCredential) {
        db.collection("usuarios")
            .doc(UserCredential.user!.uid)
            .set(usuario.toMap());
        //redirecionar para a pagina correspondete (passageiro / motorista)
        switch (usuario.tipoUsuario) {
          //caso seja motorista, será redirecionado para a pagina do motorista
          case "motorista":
            Navigator.pushNamedAndRemoveUntil(
                context,
                "/painel-motorista",
                (_) => false
            );
            break;
        //caso seja passageiro, será redirecionado para a pagina do passageiro
          case "passageiro":
          Navigator.pushNamedAndRemoveUntil(
              context,
              "/painel-passageiro",
              (_) => false);
          break;
      }

    }).catchError((error){
      _mensagemErro = "Erro ao cadastrar usuario, verifique os campos e tente novamente";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: _controllerNome,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: 'Nome:',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            TextField(
              controller: _controllerEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Email:',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            TextField(
              controller: _controllerSenha,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  hintText: 'Senha:',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Passageiro'),
                  Switch(
                      value: _tipoUsuario,
                      onChanged: (bool valor) {
                        setState(() {
                          _tipoUsuario = valor;
                        });
                      }),
                  const Text('Motorista'),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('Cadastrar'),
                  onPressed: () {
                    _validarCampos();
                  },
                ),
              ],
            ),
        //Text(_mensagemErro),
          ],

        ),
      ),
    );
  }
}
