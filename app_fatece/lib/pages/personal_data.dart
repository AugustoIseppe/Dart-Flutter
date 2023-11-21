import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meus dados",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 20.0, left: 8),
              child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png"),
                    backgroundColor: Colors.white,
                    maxRadius: 16,
                  ),
            ),
        ],
      ),
      body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: const BorderRadius.vertical(
                    bottom: Radius.elliptical(200, 80))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.png"),
                  backgroundColor: Colors.white,
                  maxRadius: 50,
                  minRadius: 50,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Amanda Silva",
                        style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.bold)),
                    Text("Ciência da Computação",
                        style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.bold)),
                    Text("4º Semestre",
                        style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.bold)),
                    Text("RA: 153876", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ),
      
          /* #################################################################################### */
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: isExpanded1 ? 10 : 5,
              child: Column(
                children: [
                  ListTile(
                    title: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Informações Pessoais",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            isExpanded1 = !isExpanded1;
                          });
                        },
                        icon: Icon(
                          isExpanded1 ? Icons.expand_less : Icons.add,
                          size: 25,
                        )),
                  ),
                  if (isExpanded1)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("Nome: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("Amanda Silva", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("CPF: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("123.456.789-09", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("RG: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("13.456.789-09 / SSP-SP", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("Data de Nascimento: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("13/02/2005", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("Cor: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("Branca", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("Sexo: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("Feminino", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("Nacionalidade: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("Brasileira Nata", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("País de Origem: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("Brasil", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("Estado de Nascimento: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("São Paulo", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("Cidade: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("Pirassununga", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("E-mail: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("amanda.silva@gmail.com", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("Celular: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("(19) 99090-8792", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: isExpanded2 ? 10 : 5,
              child: Column(
                children: [
                  ListTile(
                    title: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Logradouro",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            isExpanded2 = !isExpanded2;
                          });
                        },
                        icon: Icon(
                          isExpanded2 ? Icons.expand_less : Icons.add,
                          size: 25,
                        )),
                  ),
                  if (isExpanded2)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("Endereço: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("Rua Amanda Silva Levi, 1627", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("Bairro: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("Jardim América", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("CEP: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("13.456-09", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("Complemento: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("-", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("Cidade: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("Pirassununga", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),)
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [Text("País: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),), Text("Brasil", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),)],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: isExpanded3 ? 10 : 5,
              child: Column(
                children: [
                  ListTile(
                    title: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Filiação",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            isExpanded3 = !isExpanded3;
                          });
                        },
                        icon: Icon(
                          isExpanded3 ? Icons.expand_less : Icons.add,
                          size: 25,
                        )),
                  ),
                  if (isExpanded3)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("Mãe: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("Amanda da Silva Arlequina", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text("Pai: ",style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w900),),
                                      Text("João Américo Pederneiras", style: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          /* #################################################################################### */
        ],
      ),
        ),
      
    );
  }
}
