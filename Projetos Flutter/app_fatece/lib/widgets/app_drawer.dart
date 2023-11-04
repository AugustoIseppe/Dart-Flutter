// ignore_for_file: no_leading_underscores_for_local_identifiers

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
            ])
          ),
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
                    toolbarHeight: 100,
                    automaticallyImplyLeading: false,
                    title: Text(
                      "Bem vindo, Augusto!",
                      style: GoogleFonts.cabin(fontSize: 25),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                  ),
                  
                ],
              ),
              const Divider(),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(
                            width: 8,
                          ),
                          Text("Perfil",
                              style: GoogleFonts.anuphan(
                                  fontSize: 19, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                  ),
                ),
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
                          const Icon(Icons.attach_money),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Financeiro",
                            style: GoogleFonts.anuphan(
                                fontSize: 19, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
                          Text(
                            "Avisos",
                            style: GoogleFonts.anuphan(
                                fontSize: 19, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
                                fontSize: 19, fontWeight: FontWeight.w600),
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
            left: 35,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "® 2023 Todos os direitos reservados.",
                    style: GoogleFonts.anuphan(
                                fontSize: 13, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
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
