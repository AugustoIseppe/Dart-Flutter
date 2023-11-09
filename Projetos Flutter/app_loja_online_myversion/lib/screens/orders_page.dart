import 'package:app_loja_online_myversion/models/order_list.dart';
import 'package:app_loja_online_myversion/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/order_widget.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus pedidos"),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (context, index) => OrderWidget(order: orders.items[index]),
      ),
    );
  }
}