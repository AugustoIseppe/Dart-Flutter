import 'package:app_fatece/pages/frequency_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../utils/app_routes.dart';
import 'home_page.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class GradesPage extends StatefulWidget {
  const GradesPage({super.key});

  @override
  State<GradesPage> createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Minhas Notas",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Interface Homem-Máquina.2023.2",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: [
                                Card(
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "P1",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            Text(
                                              "9.25",
                                              style: TextStyle(fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 50,
                                        child: VerticalDivider(
                                          endIndent: 5,
                                          indent: 5,
                                          color: Colors.grey,
                                          width: 10,
                                        ),
                                      ),
                                      const Column(
                                        children: [
                                          Text(
                                            "T1",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            "2.00",
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                        child: VerticalDivider(
                                          endIndent: 5,
                                          indent: 5,
                                          color: Colors.grey,
                                          width: 10,
                                        ),
                                      ),
                                      const Column(
                                        children: [
                                          Text(
                                            "P2",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            "7.25",
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                        child: VerticalDivider(
                                          endIndent: 5,
                                          indent: 5,
                                          color: Colors.grey,
                                          width: 10,
                                        ),
                                      ),
                                      const Column(
                                        children: [
                                          Text(
                                            "T2",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            "2.00",
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                        child: VerticalDivider(
                                          endIndent: 5,
                                          indent: 5,
                                          color: Colors.grey,
                                          width: 10,
                                        ),
                                      ),
                                      const Column(
                                        children: [
                                          Text(
                                            "API",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            "1.85",
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                        child: VerticalDivider(
                                          endIndent: 5,
                                          indent: 5,
                                          color: Colors.grey,
                                          width: 10,
                                        ),
                                      ),
                                      const Column(
                                        children: [
                                          Text(
                                            "P3",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            "6.85",
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                        child: VerticalDivider(
                                          endIndent: 5,
                                          indent: 5,
                                          color: Colors.grey,
                                          width: 10,
                                        ),
                                      ),
                                      const Column(
                                        children: [
                                          Text(
                                            "NF",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            "9.85",
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                        child: VerticalDivider(
                                          endIndent: 5,
                                          indent: 5,
                                          color: Colors.grey,
                                          width: 10,
                                        ),
                                      ),
                                      const Column(
                                        children: [
                                          Text(
                                            "MF",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            "7.85",
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                        child: VerticalDivider(
                                          endIndent: 5,
                                          indent: 5,
                                          color: Colors.grey,
                                          width: 10,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Situação",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            "Suficiente",
                                            style: TextStyle(
                                                color: Colors
                                                    .lightGreenAccent[700],
                                                fontWeight: FontWeight.w900),
                                          )
                                        ],
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
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Tópicos de Matemática Aplicada.2023.2",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Card(
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "P1",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "9.25",
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "T1",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "2.00",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "P2",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "7.25",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "T2",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "2.00",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "API",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "1.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "P3",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "6.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "NF",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "9.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "MF",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "7.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "Situação",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Insuficiente",
                                      style: TextStyle(
                                          color: Colors.redAccent[700],
                                          fontWeight: FontWeight.w900),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Comportamento Organizacional.2023.2",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Card(
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "P1",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "9.25",
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "T1",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "2.00",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "P2",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "7.25",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "T2",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "2.00",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "API",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "1.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "P3",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "6.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "NF",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "9.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "MF",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "7.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "Situação",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Suficiente",
                                      style: TextStyle(
                                          color: Colors.lightGreenAccent[700],
                                          fontWeight: FontWeight.w900),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Arquitetura e Organização de Computadores.2023.2",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Card(
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "P1",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "9.25",
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "T1",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "2.00",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "P2",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "7.25",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "T2",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "2.00",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "API",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "1.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "P3",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "6.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "NF",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "9.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "MF",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "7.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "Situação",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Suficiente",
                                      style: TextStyle(
                                          color: Colors.lightGreenAccent[700],
                                          fontWeight: FontWeight.w900),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Ordenação e Pesquisa de Dados.2023.2",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Card(
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "P1",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "9.25",
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "T1",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "2.00",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "P2",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "7.25",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "T2",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "2.00",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "API",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "1.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "P3",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "6.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "NF",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "9.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "MF",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "7.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "Situação",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Suficiente",
                                      style: TextStyle(
                                          color: Colors.lightGreenAccent[700],
                                          fontWeight: FontWeight.w900),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Eletiva IV. (Gestão do conhecimento).2023.2",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Card(
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "P1",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "9.25",
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "T1",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "2.00",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "P2",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "7.25",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "T2",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "2.00",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "API",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "1.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "P3",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "6.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "NF",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "9.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "MF",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "7.85",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    endIndent: 5,
                                    indent: 5,
                                    color: Colors.grey,
                                    width: 10,
                                  ),
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "Situação",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Insuficiente",
                                      style: TextStyle(
                                          color: Colors.redAccent[700],
                                          fontWeight: FontWeight.w900),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15)
          ),
          child: const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: GNav(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              backgroundColor: Colors.blue,
              color: Colors.white,
              activeColor: Colors.black,
              tabBackgroundColor: Colors.lightBlueAccent,
              padding: EdgeInsets.all(10),
              tabs: [
              GButton(icon: Icons.home),
              GButton(icon: Icons.border_color_outlined),
              GButton(icon: Icons.auto_stories_sharp),
              GButton(icon: Icons.timeline_outlined),
              GButton(icon: Icons.monetization_on),
            ]),
          ),
        ),
      )

     );
  }
}
