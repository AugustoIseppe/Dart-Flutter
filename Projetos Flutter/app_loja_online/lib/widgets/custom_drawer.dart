import 'package:app_loja_online/models/user_model.dart';
import 'package:app_loja_online/screens/login_screen.dart';
import 'package:app_loja_online/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;
  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    /* MENU LATERAL */
    //função para criar o background da tela
    Widget _buildDrawerBack() => Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 203, 236, 241),
              Colors.white,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
        );
    return Drawer(
      //drawer -> barra lateral
      child: Stack(
        //stack -> responsável por sobrepor elementos
        children: [
          _buildDrawerBack(),
          ListView(
            padding: const EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 16.0, 0.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    const Positioned(
                        top: 8.0,
                        left: 0.0,
                        // \n -> quebra de linha
                        child: Text(
                          "Flutter's\nClothing",
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        )),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: ScopedModelDescendant<UserModel>(
                        //O ScopedModelDescendant está colocado neste local do código, pois somente aqui
                        // que será reconstruida a tela
                        builder: (context, child, model) {
                            return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}',
                            style: TextStyle(
                                color: Colors.black ,fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            child: Text(
                              !model.isLoggedIn() ? "Entre ou Cadastre-se" : "Sair",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              if(!model.isLoggedIn()) {
                                Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                              } else {
                                // model.signOut();
                              }
                              
                            },
                          ),
                        ],
                      );
                        },
                        ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              //Olhar drawer_tile.dart -> responsável por criar cada elemento DrawerTile
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.list, "Produtos", pageController, 1),
              DrawerTile(Icons.location_on, "Lojas", pageController, 2),
              DrawerTile(
                  Icons.playlist_add_check, "Meus Pedidos", pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
