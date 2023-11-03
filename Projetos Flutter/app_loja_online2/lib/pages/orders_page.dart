import 'package:app_loja_online2/models/order_lista.dart';
import 'package:app_loja_online2/widgets/app_drawer.dart';
import 'package:app_loja_online2/widgets/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus pedidos"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (context, index) {
          return OrderWidget(order: orders.items[index]);
        },
        ),
    );
  }
}