import 'package:app_testes/LojaOnline/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;
  CustomDrawer(this.pageController, {super.key});

  Widget createBackGroundDrawer() => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 203, 236, 241),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          createBackGroundDrawer(),
          ListView(
            padding: const EdgeInsets.only(left: 32, top: 16),
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 16.0, 0.0),
                height: 170,
                child: Stack(
                  children: [
                    const Positioned(
                        top: 8.0, left: 0.0, child: Text('Flutter\nClothing', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30), textAlign: TextAlign.start,)),
                    const Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: Text('Olá, Augusto Iseppe')),
                    Positioned(
                      bottom: 50,
                      child: GestureDetector(
                        onTap: () => print("Objeto selecionado"),
                        child: Text('Entre ou Cadastre-se')))
                  ],
                ),
              ),
              const Divider(),
              DrawerTile(Icons.home, "Página Inicial", pageController, 0),
              DrawerTile(Icons.list, "Produtos", pageController, 1),
              DrawerTile(Icons.store , "Nossas Lojas", pageController, 2),
              DrawerTile(Icons.shop , "Meus Pedidos", pageController, 3),
            ],
          ),
        ],

      ),
    );
  }
}
