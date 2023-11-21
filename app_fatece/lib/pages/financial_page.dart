import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../utils/app_routes.dart';

class FinancialPage extends StatefulWidget {
  const FinancialPage({super.key});

  @override
  State<FinancialPage> createState() => FinancialPageState();
}

class FinancialPageState extends State<FinancialPage> {
  final Set<int> _expandedIndices = {};
  final Set<int> _expandedParcelas = {};

  final List<String> itemTitles = [
    "380564 - Ciência da Computação (2023.2)",
    "290283 - Ciência da Computação (2023.1)",
    "233850 - Ciência da Computação (2022.2)",
    "193462 - Ciência da Computação (2022.1)",
  ];
  final List<String> itemSubtitles = [
    "Presencial FATECE | Matriculado em: 23/06/2023",
    "Presencial FATECE | Matriculado em: 17/11/2022",
    "Presencial FATECE | Matriculado em: 09/06/2022",
    "Presencial FATECE | Matriculado em: 03/02/2022",
  ];

  final List<String> itemParcelas = [
    "Março - 07/03/2023",
    "Abril - 07/04/2023",
    "Maio - 07/05/2023",
    "Junho - 07/06/2023",
    "Julho - 07/07/2023",
    "Agosto -07/08/2023",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Financeiro",
          style: TextStyle(fontWeight: FontWeight.bold),
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
                      title: Text(
                        itemTitles[index],
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                      subtitle: Text(itemSubtitles[index],
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
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
                          icon: Icon(
                            isExpanded ? Icons.expand_less : Icons.expand_more,
                            color: Colors.black,
                            size: 30,
                          )),
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
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Valor Integral",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "R\$6.045,84",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Com Desconto",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "R\$ 1.146,08",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Pontualidade 1º dia",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "R\$ 894,18",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Multa",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "R\$0,00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Juros",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "R\$ 0,00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Valor Pago",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "R\$ 596,12",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Text(
                                    "Parcelas",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  Column(
                                    children: List.generate(
                                      itemParcelas.length,
                                      (index) {
                                        bool isExpandedParcelas =
                                            _expandedParcelas.contains(index);
                                        return Column(
                                          children: [
                                            Card(
                                              elevation: 0,
                                              margin: const EdgeInsets.all(1),
                                              color: Colors.white54,
                                              child: ListTile(
                                                title: Text(
                                                  itemParcelas[index],
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.start,
                                                ),
                                                trailing: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (isExpandedParcelas) {
                                                        _expandedParcelas
                                                            .remove(index);
                                                      } else {
                                                        _expandedParcelas
                                                            .add(index);
                                                      }
                                                    });
                                                  },
                                                  icon: Icon(
                                                    isExpandedParcelas
                                                        ? Icons.expand_less
                                                        : Icons.expand_more,
                                                    size: 25,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (isExpandedParcelas)
                                              const Card(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Valor Integral",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          Text(
                                                            "R\$ 1.007,64",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Com Desconto",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),),
                                                          Text(
                                                            "R\$ 149,03",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              "Pontualidade 1º dia",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),),
                                                          Text(
                                                            "R\$ 149,03",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Multa",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),),
                                                          Text(
                                                            "R\$ 0,00",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Juros",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),),
                                                          Text(
                                                            "R\$ 0,00",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Valor Pago",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),),
                                                          Text(
                                                            "R\$ 149,03",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              "Data Vencimento",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),),
                                                          Text(
                                                            "R\$ 149,03",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              "Data Pagamento",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),),
                                                          Text(
                                                            "R\$ 149,03",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Situação",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),),
                                                          Text(
                                                            "Pago",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 18.0),
                                                        child: Row(
                                                          children: [
                                                            Chip(
                                                                backgroundColor:
                                                                    Colors.lightGreenAccent
                                                                        ,
                                                                label: Text(
                                                                    "Pago",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900))),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            Icon(
                                                              Icons.description,
                                                              color:
                                                                  Colors.black,
                                                              size: 30,
                                                            ),
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            Icon(
                                                              Icons.qr_code,
                                                              color:
                                                                  Colors.black,
                                                              size: 30,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                  GButton(
                    icon: Icons.auto_stories_sharp,
                    onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.MATERIAL_CLASSROOM_PAGE);
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
