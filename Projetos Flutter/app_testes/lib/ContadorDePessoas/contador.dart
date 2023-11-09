import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
    int pessoasLocal = 0;
        void increment() {
      setState(() {
      pessoasLocal++;
        if (pessoasLocal >=20) {
          pessoasLocal = 20;
        }
      });
    }

    void decrement() {
      setState(() {
      pessoasLocal--;
        if (pessoasLocal <= 0) {
          pessoasLocal = 0;
        }
      });
    }

    bool get isFull => pessoasLocal == 20;
    bool get isEmpty => pessoasLocal == 0;

        Widget buildContainer() {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Color.fromARGB(255, 211, 210, 210),
            Color.fromARGB(255, 192, 192, 192),
            Color.fromARGB(255, 187, 187, 187),
            Color.fromARGB(136, 83, 83, 83)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador de Pessoas"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          buildContainer(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("$pessoasLocal",
                  style: const TextStyle(fontSize: 40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: isEmpty? null : decrement,
                        child: const Icon(Icons.remove)),
                    TextButton(
                        onPressed: isFull? null : increment,
                        child: const Icon(Icons.add))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
