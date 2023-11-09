import 'package:flutter/material.dart';

class DadosCep extends StatefulWidget {
  final String cep;
  final String rua;
  final String bairro;
  final String complemento;
  final String localidade;
  final String ddd;
  final String uf;
  final String ibge;
  final String gia;
  final String siafi;
  DadosCep(
      {required this.cep,
      required this.rua,
      required this.bairro,
      required this.complemento,
      required this.localidade,
      required this.ddd,
      required this.uf,
      required this.ibge,
      required this.gia,
      required this.siafi,
      super.key});

  @override
  State<DadosCep> createState() => _DadosCepState();
}

class _DadosCepState extends State<DadosCep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cep: ${widget.cep}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Cep: ${widget.cep}', style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text('Rua: ${widget.rua}', style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text('Bairro: ${widget.bairro}', style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text('Complemento: ${widget.complemento}', style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text('Localidade: ${widget.localidade}', style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text('DDD: ${widget.ddd}', style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text('UF: ${widget.uf}', style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text('IBGE: ${widget.ibge}', style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text('GIA: ${widget.gia}', style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text('Siafi: ${widget.siafi}', style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
