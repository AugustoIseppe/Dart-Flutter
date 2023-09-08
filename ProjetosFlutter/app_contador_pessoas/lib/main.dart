import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: AppSorveteria(),
    ));

class AppSorveteria extends StatefulWidget {
  const AppSorveteria({super.key});

  @override
  State<AppSorveteria> createState() => _AppSorveteriaState();
}

class _AppSorveteriaState extends State<AppSorveteria> {
  int pessoasLocal = 0;
  void _funcaoEntrar() {
    setState(() {
      pessoasLocal++;
      if (pessoasLocal >= 20) {
        pessoasLocal= 20;
      }
    });
  }

  void _funcaoSair() {
    setState(() {
      pessoasLocal--;
      if(pessoasLocal <=0 ){
        pessoasLocal = 0;
        
      }
    });
  }

  bool get isEmpty => pessoasLocal == 0;
  bool get isFull => pessoasLocal == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pessoas Sorveteria'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(isFull ? 'LOTADO' : 'PODE ENTRAR',
            style: TextStyle(fontSize: 40, color: isFull ? Colors.red : Colors.green),
          ),
          Text( isEmpty ? "Local Vazio" : "$pessoasLocal",
            style: TextStyle(fontSize: 30, color: isFull ? Colors.red : Colors.green),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: isEmpty ? Colors.red.withOpacity(0.2) : Colors.red,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: isEmpty ? null : _funcaoSair,
                child: const Text('Saiu',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: isFull? Colors.green.withOpacity(0.2) : Colors.green,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: _funcaoEntrar,
                child: const Text(
                  'Entrou',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
