// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:app_fatece/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    Widget _buildCreateBackground() => Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 202, 225, 245),
            Color.fromARGB(255, 202, 225, 245),
            Color.fromARGB(255, 202, 225, 245),
            Color.fromARGB(255, 202, 225, 245),
          ])),
        );

    return Drawer(
      child: Stack(
        children: [
          _buildCreateBackground(),
          Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBar(
                    toolbarHeight: 70,
                    automaticallyImplyLeading: false,
                    title: Text(
                      "Bem vinda, Amanda!",
                      style: GoogleFonts.cabin(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.blue[200],
                    elevation: 10,
                  ),
                ],
              ),
              // const Divider(height: 5,),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.PERSONALDATA_PAGE);
                  },
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.PERSONALDATA_PAGE);
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(
                              width: 8,
                            ),
                            Text("Perfil",
                                style: GoogleFonts.anuphan(
                                    fontSize: 19, fontWeight: FontWeight.w800))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey[500],
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.FINANCIAL_PAGE);
                  },
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          const Icon(Icons.attach_money),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Financeiro",
                            style: GoogleFonts.anuphan(
                                fontSize: 19, fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey[500],
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          const Icon(Icons.warning),
                          const SizedBox(
                            width: 8,
                          ),
                          Stack(
                            children: [
                              Text(
                                "Avisos  ",
                                style: GoogleFonts.anuphan(
                                    fontSize: 19, fontWeight: FontWeight.w800),
                                textAlign: TextAlign.left,
                              ),
                              Positioned(
                                right:0,
                                top:0,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text("2", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 11), textAlign: TextAlign.center,),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey[500],
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          const Icon(Icons.headphones),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Solitações",
                            style: GoogleFonts.anuphan(
                                fontSize: 19, fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey[500],
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          const Icon(Icons.event),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Eventos",
                            style: GoogleFonts.anuphan(
                                fontSize: 19, fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 30,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "® 2023 Todos os direitos reservados.",
                    style: GoogleFonts.anuphan(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    width: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          "https://sga.ciebe.com.br/img/logo-escura.png?1591024870",
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
