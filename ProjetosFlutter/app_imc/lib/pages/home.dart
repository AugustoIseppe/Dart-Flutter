import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String infoText = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      infoText = "";
    });
  }

  void _calcularImc() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    double imc = weight / (height * height);
    setState(() {
      infoText = imc.toStringAsPrecision(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[400],
        actions: [
          IconButton(onPressed: _resetFields, icon: const Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Card(
            elevation: 5,
            color: Colors.white70,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: weightController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o seu peso';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Peso',
                          labelStyle: const TextStyle(color: Colors.blue),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: heightController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe sua altura';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Altura',
                          labelStyle: const TextStyle(color: Colors.blue),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _calcularImc();
                          }
                        },
                        child: const Text('Calcular IMC')),
                    const Divider(
                      color: Colors.black,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Calcule seu IMC ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'O IMC (Índice de Massa Corporal) é um calculo que server para'
                          'avaliar se a pessoa está dentro do seu peso idel',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        const Text(
                          'Valores do IMC:',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Text('Pessoas de 20 a 60 anos'),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.grey[300],
                              alignment: Alignment.center,
                              width: 170,
                              height: 30,
                              child: const Text(
                                'Valor do IMC',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                              height: 34,
                            ),
                            Container(
                              color: Colors.grey[300],
                              alignment: Alignment.center,
                              width: 170,
                              height: 30,
                              child: const Text(
                                'Classificação',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.yellowAccent,
                              alignment: Alignment.center,
                              width: 170,
                              height: 30,
                              child: const Text(
                                'Menor que 18,5',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                              height: 34,
                            ),
                            Container(
                              color: Colors.yellowAccent,
                              alignment: Alignment.center,
                              width: 170,
                              height: 30,
                              child: const Text(
                                'Baixo Peso',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.lightGreenAccent,
                              alignment: Alignment.center,
                              width: 170,
                              height: 30,
                              child: const Text(
                                'De 18,5 a 24,99',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                              height: 34,
                            ),
                            Container(
                              color: Colors.lightGreenAccent,
                              alignment: Alignment.center,
                              width: 170,
                              height: 30,
                              child: const Text(
                                'Normal',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.orange,
                              alignment: Alignment.center,
                              width: 170,
                              height: 30,
                              child: const Text(
                                'De 25 a 29,99',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                              height: 34,
                            ),
                            Container(
                              color: Colors.orange,
                              alignment: Alignment.center,
                              width: 170,
                              height: 30,
                              child: const Text(
                                'Sobrepeso',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.red,
                              alignment: Alignment.center,
                              width: 170,
                              height: 30,
                              child: const Text(
                                'Acima de 30',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                              height: 34,
                            ),
                            Container(
                              color: Colors.red,
                              alignment: Alignment.center,
                              width: 170,
                              height: 30,
                              child: const Text(
                                'Obesidade',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text('Seu IMC: $infoText')
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
