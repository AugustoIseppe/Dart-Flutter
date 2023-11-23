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
        title: const Text(
          "Frequência Escolar",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 5,
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
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: List.generate(itemTitles.length, (index) {
              bool isExpanded = _expandedIndices.contains(index);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  color: Colors.blue[200],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(itemTitles[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
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
                                        Text("Aula - 05/09/2023", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                        Text(
                                          "4/4",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 10, 219, 17),
                                              fontWeight: FontWeight.w900,fontSize: 16),
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
                                        Text("Aula - 12/09/2023", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                        Text(
                                          "3/4",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w900,fontSize: 16),
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
                                        Text("Aula - 20/09/2023", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                        Text(
                                          "0/4",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w900,fontSize: 16),
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
                                        Text("Aula - 27/09/2023", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                        Text(
                                          "3/4",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w900,fontSize: 16),
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
                                        Text("Aula - 06/10/2023", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                        Text(
                                          "4/4",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 10, 219, 17),
                                              fontWeight: FontWeight.w900,
                                              fontSize: 16
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  // height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                     const Column(
                                        children: [
                                          Text("Presente", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 15),),
                                          Chip(
                                            label: Text("56", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 15),),
                                            elevation: 5,
                                            backgroundColor: Colors.white,
                                          ),
                                        ],
                                      ),
                                      VerticalDivider(color: Colors.black, width: 2),

                                      const Column(
                                        children: [
                                          Text("Ausente", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 15),),
                                          Chip(
                                            label: Text("4", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 15),),
                                            elevation: 5,
                                            backgroundColor: Colors.white,
                                          ),
                                        ],
                                      ),
                                      const Column(
                                        children: [
                                          Text("Total de Aulas", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 15),),
                                          Chip(
                                            label: Text("60", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 15),),
                                            elevation: 5,
                                            backgroundColor: Colors.white,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text("Frequência", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 15),),
                                          Chip(
                                            label: const Text("75%", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 15),),
                                            elevation: 5,
                                            backgroundColor: Colors.lightGreenAccent.shade400,
                                          ),
                                        ],
                                      ),
                                      
                                      
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: GNav(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                backgroundColor: Colors.blue,
                color: Colors.white,
                activeColor: Colors.white,
                // tabBackgroundColor: Colors.lightBlueAccent,
                padding: const EdgeInsets.all(10),
                tabs: [
                  GButton(
                      icon: Icons.home,
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.HOME_PAGE);
                      }),
                  GButton(
                      icon: Icons.border_color_outlined,
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.GRADES_PAGE);
                      }),
                  GButton(icon: Icons.auto_stories_sharp,
                  onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.MATERIAL_CLASSROOM_PAGE);
                      }
                  ),
                  // GButton(icon: Icons.timeline_outlined),
                  GButton(icon: Icons.monetization_on,
                  onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.FINANCIAL_PAGE);
                      }),
                ]),
          ),
        ),
      ),
    );
  }
}
