import 'package:app_fatece/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "Página Inicial",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            decoration: BoxDecoration(color: Colors.blue[200]),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 30,
                          child: Container(
                            decoration: const BoxDecoration(),
                            width: 140,
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.border_color_outlined,
                                  color: Colors.blue,
                                  size: 60,
                                ),
                                Text(
                                  "Boletim \nEscolar",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 30,
                          child: Container(
                            decoration: const BoxDecoration(),
                            width: 140,
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.monetization_on,
                                  color: Colors.blue,
                                  size: 60,
                                ),
                                Text(
                                  "Visualizar \nParcelas",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 30,
                          child: Container(
                            decoration: const BoxDecoration(),
                            width: 140,
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.auto_stories_sharp,
                                  color: Colors.blue,
                                  size: 60,
                                ),
                                Text(
                                  "Matérias",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 30,
                          child: Container(
                            decoration: const BoxDecoration(),
                           width: 140,
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.timeline_outlined,
                                  color: Colors.blue,
                                  size: 60,
                                ),
                                Text(
                                  "Frequência",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 46,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))
              ),
              width: 300,
              height: 70,
              child: FittedBox(
                child: Image.asset("images/logo_fatece.png"),
              ),
            ),
          ),
          Container(
            height: 240,
            decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: const BorderRadius.vertical(
                    bottom: Radius.elliptical(200, 80))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("images/graduated.png"),
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
                    Text("Augusto Iseppe Balan",
                        style: GoogleFonts.lato(fontSize: 17)),
                    Text("Ciência da Computação",
                        style: GoogleFonts.lato(fontSize: 17)),
                    Text("4º Semestre", style: GoogleFonts.lato(fontSize: 17)),
                    Text("RA: 153876", style: GoogleFonts.lato(fontSize: 17))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
