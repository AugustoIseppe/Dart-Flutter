import 'dart:convert';

import 'package:app_testes/BuscadorDeCep/dados_cep.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BuscardoCep extends StatefulWidget {
  const BuscardoCep({super.key});

  @override
  State<BuscardoCep> createState() => _BuscardoCepState();
}

class _BuscardoCepState extends State<BuscardoCep> {
  final _cepController = TextEditingController();
  String resultado =
      "Atenção: Uso massivo para validação de bases de dados locais,"
      "poderá automaticamente bloquear seu acesso por tempo indeterminado."
      "Não distribuímos ou comercializamos bases de dados.";

  Future<Map<String, dynamic>> buscarCep() async {
    String cep = _cepController.text;
    String url = "https://viacep.com.br/ws/$cep/json/";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = jsonDecode(response.body);
    String localidade = retorno["localidade"];
    String rua = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String complemento = retorno["complemento"];
    String ddd = retorno["ddd"];
    String uf = retorno["uf"];
    String ibge = retorno["ibge"];
    String gia = retorno["gia"];
    String siafi = retorno["siafi"];

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DadosCep(
              cep: cep,
              localidade: localidade,
              rua: rua,
              bairro: bairro,
              complemento: complemento,
              ddd: ddd,
              uf: uf,
              ibge: ibge,
              gia: gia,
              siafi: siafi),
        ));

        return retorno;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buscador de Cep"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: _cepController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Informe o CEP"),
            ),
          ),
          TextButton(
            onPressed: buscarCep,
            style: TextButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text(
              "Buscar",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
