import 'package:flutter/material.dart';

class MeusPedidosTab extends StatelessWidget {
  const MeusPedidosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[400],
      child: Center(child: Text("meus\npedidos")),
    );
  }
}