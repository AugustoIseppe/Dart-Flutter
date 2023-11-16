import 'package:app_fatece/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ClassMaterial extends StatefulWidget {
  const ClassMaterial({super.key});

  @override
  State<ClassMaterial> createState() => _ClassMaterialState();
}

class _ClassMaterialState extends State<ClassMaterial> {
  final List<Color> backgroundColor = [
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.grey,
    Colors.pink,
    Colors.cyan,
  ];

  final List<String> contentMaterial = [
    "Tópicos de Matemática \nAplicada.2023.2",
    "Interface \nHomem-Máquina.2023.2",
    "Comportamento \nOrganizacional.2023.2",
    "Arquitetura e Organização \nde Computadores.2023.2",
    "Ordenação e Pesquisa \n de Dados.2023.2",
    " Eletiva IV. \n(Gestão do conhecimento).\n2023.2"
  ];

  final List<String> teachers = [
    "Julyette Priscila Redling",
    "Stefane Vieira Menezes",
    "José Carlos Pereira da Cruz Júnior",
    "Alessandro Viola Pizzoleto",
    "Giuliano Lacerda Dall Armellina",
    "Julia Cintra Terra",
  ];

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
          children: List.generate(contentMaterial.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                width: double.infinity,
                height: 130,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.CONTENT_CLASSROOM_PAGE);
                  },
                  child: Card(
                    color: backgroundColor[index].withOpacity(0.2),
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
                                child: CircleAvatar(
                                    maxRadius: 6,
                                    minRadius: 3,
                                    backgroundImage: AssetImage(
                                        "images/imagem${index + 1}.jpg"),
                                    child: const Text("")))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              contentMaterial[index],
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, left: 3),
                              child: Text(
                                "Docente: ${teachers[index]}",
                                style: const TextStyle(
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
                  const GButton(icon: Icons.auto_stories_sharp),
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
