import 'package:flutter/material.dart';
class OrderScreen extends StatelessWidget {

  final String orderId;
  OrderScreen(this.orderId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedido Realizado"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check, color: Colors.greenAccent),
            Text("Pedido realizado com sucesso"),
            Text("Código do Pedido: ${orderId}")
          ],
        ),
      ),
    );
  }
}