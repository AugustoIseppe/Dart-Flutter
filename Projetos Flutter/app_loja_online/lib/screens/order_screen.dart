import 'package:flutter/material.dart';
class OrderScreen extends StatelessWidget {

  final String orderId;
  const OrderScreen(this.orderId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedido Realizado"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check, color: Colors.greenAccent),
            const Text("Pedido realizado com sucesso"),
            Text("Código do Pedido: $orderId")
          ],
        ),
      ),
    );
  }
}