import 'package:app_fatece/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ClassMaterial extends StatefulWidget {
  const ClassMaterial({super.key});

  @override
  State<ClassMaterial> createState() => _ClassMaterialState();
}

class _ClassMaterialState extends State<ClassMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Material de Classe"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              width: double.infinity,
              height: 130,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.MATEMATICA_PAGE);
                },
                child: Card(
                  color: Colors.yellow.withOpacity(0.7),
                  child: Stack(children: [
                    Positioned(
                      right: 0,
                      bottom: 10,
                      left: 250,
                      top: 10,
                      child: Opacity(
                        opacity: 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: const CircleAvatar(
                            maxRadius: 6,
                            minRadius: 3,
                            backgroundImage: AssetImage("images/imagem1.jpg"),
                            child: Text(""),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tópicos de Matemática \nAplicada.2023.2",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10, left: 3),
                            child: Text(
                              "Docente: Julyette Priscila Redling",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              width: double.infinity,
              height: 130,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.INTERFACE_PAGE);
                },
                child: Card(
                  color: Colors.blue.withOpacity(0.7),
                  child: Stack(children: [
                    Positioned(
                      right: 0,
                      bottom: 10,
                      left: 250,
                      top: 10,
                      child: Opacity(
                        opacity: 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: const CircleAvatar(
                            maxRadius: 6,
                            minRadius: 3,
                            backgroundImage: AssetImage("images/imagem2.jpg"),
                            child: Text(""),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Interface \nHomem-Máquina.2023.2",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10, left: 3),
                            child: Text(
                              "Docente: Stefane Vieira Menezes",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              width: double.infinity,
              height: 130,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.COMPORTAMENTO_PAGE);
                },
                child: Card(
                  color: Colors.grey.withOpacity(0.7),
                  child: Stack(children: [
                    Positioned(
                      right: 0,
                      bottom: 10,
                      left: 250,
                      top: 10,
                      child: Opacity(
                          opacity: 0.8,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: const CircleAvatar(
                                  maxRadius: 6,
                                  minRadius: 3,
                                  backgroundImage:
                                      AssetImage("images/imagem3.jpg"),
                                  child: Text("")))),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Comportamento \nOrganizacional.2023.2",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10, left: 3),
                            child: Text(
                              "Docente: José Carlos Pereira da Cruz Júnior",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              width: double.infinity,
              height: 130,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.ARQUITETURA_PAGE);
                },
                child: Card(
                  color: Colors.cyan,
                  child: Stack(children: [
                    Positioned(
                      right: 0,
                      bottom: 10,
                      left: 250,
                      top: 10,
                      child: Opacity(
                          opacity: 0.8,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: const CircleAvatar(
                                  maxRadius: 6,
                                  minRadius: 3,
                                  backgroundImage:
                                      AssetImage("images/imagem4.jpg"),
                                  child: Text("")))),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Arquitetura e Organização\nde Computadores.2023.2",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10, left: 3),
                            child: Text(
                              "Docente: Alessandro Viola Pizzoleto",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              width: double.infinity,
              height: 130,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.ORDENACAO_PAGE);
                },
                child: Card(
                  color: Colors.green.withOpacity(0.7),
                  child: Stack(children: [
                    Positioned(
                      right: 0,
                      bottom: 10,
                      left: 250,
                      top: 10,
                      child: Opacity(
                          opacity: 0.8,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: const CircleAvatar(
                                  maxRadius: 6,
                                  minRadius: 3,
                                  backgroundImage:
                                      AssetImage("images/imagem5.jpg"),
                                  child: Text("")))),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ordenação e Pesquisa\nde Dados.2023.2",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10, left: 3),
                            child: Text(
                              "Docente: Giuliano Lacerda Dall Armellina",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              width: double.infinity,
              height: 130,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.ELETIVA_PAGE);
                },
                child: Card(
                  color: Colors.red.withOpacity(0.7),
                  child: Stack(children: [
                    Positioned(
                      right: 0,
                      bottom: 10,
                      left: 250,
                      top: 10,
                      child: Opacity(
                          opacity: 0.8,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: const CircleAvatar(
                                  maxRadius: 6,
                                  minRadius: 3,
                                  backgroundImage:
                                      AssetImage("images/imagem6.jpg"),
                                  child: Text("")))),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Eletiva IV.\n(Gestão do conhecimento)\n2023.2",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10, left: 3),
                            child: Text(
                              "Docente: Julia Cintra Terra",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ],
      )),
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
                const GButton(icon: Icons.auto_stories_sharp),
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
