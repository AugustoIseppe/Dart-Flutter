import 'package:flutter/material.dart';
import 'package:projeto_uber/telas/Cadastro.dart';
import 'package:projeto_uber/telas/Login.dart';
import 'package:projeto_uber/telas/PainelMotorista.dart';
import 'package:projeto_uber/telas/PainelPassageiro.dart';

class Rotas {
  static Route<dynamic>? gerarRotas(RouteSettings settings){
    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (_) => const Login()
        );
      case "/cadastro":
        return MaterialPageRoute(builder: (_) => const Cadastro()
        );
      case "/painel-passageiro":
        return MaterialPageRoute(builder: (_) => const PainelPassageiro()
        );
      case "/painel-motorista":
        return MaterialPageRoute(builder: (_) => const PainelMotorista()
        );
      default:
        _erroRota();
    }
    return null;
  }
  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(
        builder: (_){
          return Scaffold(
            appBar: AppBar(
              title: const Text('Página não encotrada'),
            ),
            body: const Center(
              child: Text('Ops! Ocorreu algum erro inesperado'),
            ),
          );
        }
    );
  }
}