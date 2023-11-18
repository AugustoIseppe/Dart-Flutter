import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../utils/app_routes.dart';

class Matematica extends StatefulWidget {
  const Matematica({super.key});

  @override
  State<Matematica> createState() => MatematicaState();
}

class MatematicaState extends State<Matematica> {
  bool isExpanded0 = false;
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tópicos da Matemática Aplicada",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          const Padding(
              padding: EdgeInsets.only(right: 10.0, left: 8),
              child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png"),
                    backgroundColor: Colors.white,
                  ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: Colors.blue,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        "Aula 00",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        "Álgebra Linear",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              isExpanded0 = !isExpanded0;
                            });
                          },
                          icon: Icon(
                            isExpanded0 ? Icons.expand_less : Icons.expand_more,
                            color: Colors.white,
                          )),
                    ),
                    if (isExpanded0)
                      Card(
                        color: Colors.white70,
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
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.download,
                                              size: 35,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Download",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.visibility,
                                              size: 35,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Visualizar",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: Colors.blue,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        "Aula 01",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        "Cálculo Diferencial e Integral",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              isExpanded1 = !isExpanded1;
                            });
                          },
                          icon: Icon(
                            isExpanded1 ? Icons.expand_less : Icons.expand_more,
                            color: Colors.white,
                          )),
                    ),
                    if (isExpanded1)
                      Card(
                        color: Colors.white70,
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
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.download,
                                              size: 35,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Download",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.visibility,
                                              size: 35,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Visualizar",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: Colors.blue,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        "Aula 02",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        "Teoria dos Números",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              isExpanded2 = !isExpanded2;
                            });
                          },
                          icon: Icon(
                            isExpanded2 ? Icons.expand_less : Icons.expand_more,
                            color: Colors.white,
                          )),
                    ),
                    if (isExpanded2)
                      Card(
                        color: Colors.white70,
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
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.download,
                                              size: 35,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Download",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.visibility,
                                              size: 35,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Visualizar",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: Colors.blue,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        "Aula 03",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        "Lógica Matemática",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              isExpanded3 = !isExpanded3;
                            });
                          },
                          icon: Icon(
                            isExpanded3 ? Icons.expand_less : Icons.expand_more,
                            color: Colors.white,
                          )),
                    ),
                    if (isExpanded3)
                      Card(
                        color: Colors.white70,
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
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.download,
                                              size: 35,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Download",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.visibility,
                                              size: 35,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Visualizar",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: Colors.blue,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        "Aula 04",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        "Probabilidade e Estatística",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              isExpanded4 = !isExpanded4;
                            });
                          },
                          icon: Icon(
                            isExpanded4 ? Icons.expand_less : Icons.expand_more,
                            color: Colors.white,
                          )),
                    ),
                    if (isExpanded4)
                      Card(
                        color: Colors.white70,
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
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.download,
                                              size: 35,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Download",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.visibility,
                                              size: 35,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Visualizar",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
