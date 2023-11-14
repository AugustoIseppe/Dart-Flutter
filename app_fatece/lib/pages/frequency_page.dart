import 'package:app_fatece/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class FrequencyPage extends StatefulWidget {
  const FrequencyPage({super.key});

  @override
  State<FrequencyPage> createState() => _FrequencyPageState();
}

class _FrequencyPageState extends State<FrequencyPage> {
  final Set<int> _expandedIndices = {};

  final List<String> itemTitles = [
    "Interface Homem-Máquina.2023.2",
    "Tópicos de Matemática Aplicada.2023.2",
    "Comportamento Organizacional.2023.2",
    "Arquitetura e Organização de Computadores.2023.2",
    "Ordenação e Pesquisa de Dados.2023.2",
    "Eletiva IV. (Gestão do conhecimento).2023.2",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Frequência Escolar", style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(itemTitles.length, (index) {
              bool isExpanded = _expandedIndices.contains(index);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.blue[200],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(itemTitles[index]),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                if (isExpanded) {
                                  _expandedIndices.remove(index);
                                } else {
                                  _expandedIndices.add(index);
                                }
                              });
                            },
                            icon: Icon(isExpanded
                                ? Icons.expand_less
                                : Icons.expand_more)),
                      ),
                      if (isExpanded)
                        Card(
                          color: Colors.blue[100],
                          elevation: 5,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 15),
                                child: const Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Aula - 05/09/2023"),
                                        Text(
                                          "4/4",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Aula - 12/09/2023"),
                                        Text(
                                          "3/4",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Aula - 20/09/2023"),
                                        Text(
                                          "0/4",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Aula - 27/09/2023"),
                                        Text(
                                          "3/4",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Aula - 06/10/2023"),
                                        Text(
                                          "4/4",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text("Presente"),
                                          Text("52"),
                                        ],
                                      ),
                                      Chip(
                                        label: Text("75%"),
                                      ),
                                      Column(
                                        children: [
                                          Text("Ausente"),
                                          Text("4"),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: GNav(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      backgroundColor: Colors.blue,
                      color: Colors.white,
                      activeColor: Colors.white,
                      // tabBackgroundColor: Colors.lightBlueAccent,
                      padding: const EdgeInsets.all(10),
                      tabs: [
                        GButton(icon: Icons.home, onPressed: (){
                          Navigator.of(context).pushNamed(AppRoutes.HOME_PAGE);
                        }),
                        GButton(icon: Icons.border_color_outlined, onPressed: (){
                          Navigator.of(context).pushNamed(AppRoutes.GRADES_PAGE);
                        }),
                        const GButton(icon: Icons.auto_stories_sharp),
                        // GButton(icon: Icons.timeline_outlined),
                        const GButton(icon: Icons.monetization_on),
                      ]),
                ),),),);
  }
}
