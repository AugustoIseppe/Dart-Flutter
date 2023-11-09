
import 'package:app_loja_online_myversion/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Bem Vindo, Augusto!"),
          ),
          ListTile(
              title: Text("Loja"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
              },
          ),
          const Divider(),
          ListTile(
              title: Text("Pedidos"),
              leading: Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
              },
          )
        ],
      ),
    );
  }
}