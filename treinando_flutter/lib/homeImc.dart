// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String infoText = '0';
  String pesoIdeal = '';



  _clearFields() {
    setState(() {
      _weightController.text = '';
      _heightController.text = '';
      infoText = '0';
      pesoIdeal = ' ';
    });
  }

  _calculateImc() {
    setState(() {
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      double imc = weight / (height * height);
      infoText = imc.toStringAsPrecision(4);
      if (imc <= 18.5) {
        pesoIdeal = 'Abaixo do Peso';
      } else if (imc >= 18.5 && imc <= 24.99) {
        pesoIdeal = 'Parabéns, seu peso está normal!';
      } else if (imc >= 25 && imc <= 29.99) {
        pesoIdeal = 'Sobrepeso';
      } else {
        pesoIdeal = 'Cuidado! Você está obeso!';
      }
    });
  }

  //bool get isNormalWeight => _weightController as double <= 18.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: _clearFields,
              icon: const Icon(Icons.refresh_outlined,
                  color: Colors.white)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
              children: [
          Container(
          decoration: const BoxDecoration(
          color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60))),
          height: 350,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _weightController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Informe o seu peso";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Weight',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                            const BorderSide(color: Colors.black))),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextFormField(
                    controller: _heightController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Informe sua altura";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Height',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                            const BorderSide(color: Colors.white))),
                    keyboardType: TextInputType.number,
                  ),
                  FilledButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(150, 40),
                      ),
                      onPressed: _calculateImc,
                      child: const Text(
                        'Calcular IMC',
                        style: TextStyle(
                            fontSize: 15, color: Colors.blueAccent),
                      ))
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Container(
              color: Colors.white,
              child: Column(
                  children: [
              Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)),
          elevation: 10,
          child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 300,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                const Text('Seu IMC: '),
            Text(
              infoText,
              style: const TextStyle(fontSize: 80),
            ),
            Text(pesoIdeal, style: const TextStyle(color:  Colors.black, fontSize: 30),),

          ],
        ),
      ),
    )],
    ),
    ),
    )
    ],
    ),
    )
    ,
    )
    );
  }
}
