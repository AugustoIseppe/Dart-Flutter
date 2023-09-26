import 'package:flutter/material.dart';

class ContadorPessoas extends StatefulWidget {
  const ContadorPessoas({super.key});

  @override
  State<ContadorPessoas> createState() => _ContadorPessoasState();
}

class _ContadorPessoasState extends State<ContadorPessoas> {
  int contador = 0;

  _increment() {
    contador++;
    setState(() {
      if (contador > 20) {
        contador = 20;
      }
    });
  }

  _decrement() {
    contador--;
    setState(() {
      if (contador < 0) {
        contador = 0;
      }
    });
  }

bool get isFull => contador == 20;
bool get isEmpty => contador == 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador de Pessoas"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? "Fechado" : "Aberto",
              style: TextStyle(fontSize: 50),
            ),
            Text(
              contador.toString(),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor:
                            isFull ? Colors.red.withOpacity(0.3) : Colors.blue),
                    onPressed: isFull ? null : _increment,
                    child: const Text("+",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold))),
                const Padding(padding: EdgeInsets.all(20)),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: isEmpty
                            ? Colors.red.withOpacity(0.3)
                            : Colors.blue),
                    onPressed: isEmpty ? null : _decrement,
                    child: const Text("-",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
