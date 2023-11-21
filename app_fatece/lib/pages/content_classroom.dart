import 'package:app_fatece/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ContentClassRoom extends StatefulWidget {
  const ContentClassRoom({super.key});

  @override
  State<ContentClassRoom> createState() => _ContentClassRoomState();
}

class _ContentClassRoomState extends State<ContentClassRoom> {
  final Set<int> _expandedIndices = {};
  bool mostrarDiferentes = false;
  final List<String> title = [
    "Aula 00 - Funções",
    "Aula 01 - Funções Quadráticas",
    "Aula 02 - Estatística e Probabilidade",
    "Aula 03 - Métodos Numéricos",
    "Aula 04 - Lógica Matemática",
    "Aula 05 - Álgebra Linear",
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Aulas",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
          children: List.generate(title.length, (index) {
            bool isExpanded = _expandedIndices.contains(index);
                      return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.blue[200],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(title[index]),
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
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Download",style: TextStyle(fontWeight: FontWeight.bold),),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(AppRoutes.MATEMATICA_PAGE);
                                      },
                                      icon: Container(
                                        height: 30,
                                        width: 40,
                                        decoration: BoxDecoration(
                                        color: Colors.white,
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: const Icon(Icons.download))),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Visualizar",style: TextStyle(fontWeight: FontWeight.bold),),
                                  IconButton(
                                      onPressed:() {
                                        Navigator.of(context).pushNamed(AppRoutes.TESTEPDF_PAGE);
                                      },
                                      icon: Container(
                                        height: 30,
                                        width: 40,
                                        decoration: BoxDecoration(
                                        color: Colors.white,
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: const Icon(Icons.visibility))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
                  GButton(icon: Icons.monetization_on,
                  onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.FINANCIAL_PAGE);
                    }
                  ),
                  GButton(
                    icon: Icons.timeline_outlined,
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.FREQUENCY_PAGE);
                    },
                  ),
                  // const GButton(icon: Icons.monetization_on),
                ]),
          ),
        ),
      ),
    );
  }
}
