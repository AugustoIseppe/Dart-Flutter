import 'package:app_conversor_moedas/main2.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert' as convert;

//URL NECESSÁRIA PARA FAZER AS REQUISIÇÕES PARA A API
const request = 'https://blockchain.info/ticker';

void main() async {
  runApp(const MaterialApp(
    home: Home2(),
  ));
}
/*
Future<Map> getData() async {
  /*NECESSÁRIO PARA FAZER A 'CONEXAO' COM A API'*/
  http.Response response = await http.get(Uri.parse(request)); //requisição
  /*########### FIM DA CONEXAO API ##############*/

  /* CONVERTER OS DADOS DA API PARA O FORMATO JSON */
  return convert.jsonDecode(response.body); //converter de json para map
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController realController = TextEditingController();
  final TextEditingController euroController = TextEditingController();
  final TextEditingController dolarController = TextEditingController();
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late double dolar;
  late double euro;

  void _realChanged(String text) {
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (euro / dolar).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  void clearFields(){
    setState(() {
      realController.text = " ";
      dolarController.text = " ";
      euroController.text = " ";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Moedas'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: Text(
                    'Carregando Dados...',
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'Erro ao carregar dados :(',
                      style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  dolar = snapshot.data!["USD"]["buy"];
                  euro = snapshot.data!["EUR"]["buy"];
                  return Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.account_balance_outlined,
                            color: Colors.grey,
                            size: 80,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          buildTextField("Dólar", "\$", dolarController,
                              _dolarChanged),
                          const SizedBox(
                            height: 10,
                          ),
                          buildTextField("Real", "R\$", realController,
                              _realChanged ),
                          const SizedBox(
                            height: 10,
                          ),
                          buildTextField("Euro", "€", euroController,
                              _euroChanged )
                        ],
                      ),
                    ),
                  );
                }
            }
          }),
    );
  }
}

Widget buildTextField(String label, String prefix, TextEditingController controller, void Function(String) converterMoeda) {
  return TextField(
    onChanged: converterMoeda,
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        prefixText: prefix),
  );
}
*/