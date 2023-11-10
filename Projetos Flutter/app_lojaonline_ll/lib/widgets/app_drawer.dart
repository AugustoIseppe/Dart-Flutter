import 'package:app_lojaonline_ll/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueGrey,
            title: Text("Bem Vindo, Augusto!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Loja"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Pedidos"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}