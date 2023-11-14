import 'package:flutter/material.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus dados", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Informações Pessoais", style: TextStyle(fontSize: 25, color: Colors.blue, fontWeight: FontWeight.w900), textAlign: TextAlign.start,),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Nome: Amanda Silva"),
                          Text("Nome Social: Amanda"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("CPF: \n123.456.789-09", textAlign: TextAlign.justify,),
                            Text("RG: \n36.789.123-4", textAlign: TextAlign.justify,),
                            Text("Orgão Emissor(RG): \nSSP/SP", textAlign: TextAlign.justify,),
                          ],
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Data de Nascimento: \n13/11/1997", textAlign: TextAlign.justify,),
                            Text("Cor: \nBranca", textAlign: TextAlign.justify,),
                            Text("Sexo: \nFeminino", textAlign: TextAlign.justify,),
                          ],
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nacionalidade: \nBrasileira Nata", textAlign: TextAlign.justify,),
                            Text("País de Origem: \nBrasil", textAlign: TextAlign.justify,),
                          ],
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Estado Nascimento: \nSP", textAlign: TextAlign.justify,),
                            Text("Cidade: \nPirassununga", textAlign: TextAlign.justify,),
                          ],
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Email: \namanda.silva@gmail.com", textAlign: TextAlign.justify,),
                            Text("Celular: \n(19)98854-9355", textAlign: TextAlign.justify,),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Logradouro", style: TextStyle(fontSize: 25, color: Colors.blue, fontWeight: FontWeight.w900), textAlign: TextAlign.start,),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("CEP: \n13.622-233"),
                          Text("Endereço\nRua Amanda Silva Levi."),
                          Text("Nº: \n2255"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Bairro: \nJardim América", textAlign: TextAlign.justify,),
                            Text("Complemento: \n -", textAlign: TextAlign.justify,),
                            
                          ],
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Cidade: \nPirassununga", textAlign: TextAlign.justify,),
                            Text("País: \nBrasil", textAlign: TextAlign.justify,),
                          ],
                        ),
                    ),
                    
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Filiação", style: TextStyle(fontSize: 25, color: Colors.blue, fontWeight: FontWeight.w900), textAlign: TextAlign.start,),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("Nome do Mãe: Maria Aparecida Silva"),
                            SizedBox(height: 10,),
                            Text("Nome do Pai: Carlos Alberto Oliveira"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}