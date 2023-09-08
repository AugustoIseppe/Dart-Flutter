// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:projeto_uber/Model/Usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = " ";
  bool _carregando = false;

/* ------ MÉTODO PARA VALIDAR CAMPOS -------*/
  _validarCampos() {
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (email.isNotEmpty) {
      if (senha.isNotEmpty) {
        //ENTRA AQUI CASO AS CONDIÇÕES SE CAMPSO NAO ESTIVEREM VAZIOS
        Usuario usuario = Usuario();
        usuario.email = email;
        usuario.senha = senha;
        //MÉTODO PARA LOGAR O USUÁRIO
        _logarUsuario(usuario);

        //SÓ ENTRARA DENTRO DO ELSE CASO DE ALGUM ERRO NA VALIDAÇÃO DO EMAIL OU SENHA
      } else {
        setState(() {
          _mensagemErro = "Digite uma senha válida";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Digite um email válido";
      });
    }
  }

  _logarUsuario(Usuario usuario) {
    //SETSTATE para o CircularProgressIndicator
    setState(() {
      _carregando = true;
    });

    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((UserCredential UserCredential) {
      //se der certo, entrará aqui dentro do then, caso contrário entrará dentro do catchError
      _redirecionPainelPorTipoUsuario(UserCredential.user!.uid);
    }).catchError((error) {
      _mensagemErro =
          "Erro ao autenticar usuario, verifique e-mail e senha e tente novamente";
    });
  }

  //_redirecionPainelPorTipoUsuario -> O usuario será redirecionado para a pagina de acordo com o tipo de usuario (passageiro/motorista)
  _redirecionPainelPorTipoUsuario(String idUsuario) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    //os dados ficam salvos dentro do snapshot
    DocumentSnapshot snapshot =
        await db.collection("usuarios").doc(idUsuario).get();

    //os dados sao retornados em forma de um MAP
    Map<String, dynamic> dados = snapshot.data() as Map<String, dynamic>;
    String tipoUsuario = dados["tipoUsuario"];
    //SETSTATE para o CircularProgressIndicator
    setState(() {
      _carregando = false;
    });

    switch (tipoUsuario) {
      case "motorista":
        Navigator.pushReplacementNamed(context, "/painel-motorista");
      case "passageiro":
        Navigator.pushReplacementNamed(context, "/painel-passageiro");
    }
  }

  _verificarUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User usuarioLogado = await auth.currentUser!;
    // ignore: unnecessary_null_comparison
    if (usuarioLogado != null) {
      String idUsuario = usuarioLogado.uid;
      _redirecionPainelPorTipoUsuario(idUsuario);
    }
  }

  @override
  void initState() {
    super.initState();
    _verificarUsuarioLogado();
  }

  /* --------------------------------------  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/fundo.png'), fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //indicador de carregando -> se for true, exibe o center
                _carregando ?
                  const Center(child: CircularProgressIndicator(backgroundColor: Colors.lightGreenAccent))
                  :
                  Container(),

                Image.asset("images/logo.png"),
                TextField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const Padding(padding: EdgeInsets.only(top: 1, bottom: 1)),
                TextField(
                  controller: _controllerSenha,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    hintText: 'Senha',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
                ElevatedButton(
                  onPressed: () {
                    _validarCampos();
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10, left: 5)),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Não tem uma conta?',
                        style: TextStyle(color: Colors.white),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10, left: 5)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/cadastro");
                        },
                        child: const Text(
                          'Cadastre-se',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(_mensagemErro),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
