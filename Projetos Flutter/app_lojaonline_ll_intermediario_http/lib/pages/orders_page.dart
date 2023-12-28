import 'package:app_lojaonline_ll_intermediario_http/models/order_list.dart';
import 'package:app_lojaonline_ll_intermediario_http/widgets/app_drawer.dart';
import 'package:app_lojaonline_ll_intermediario_http/widgets/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}


class _OrdersPageState extends State<OrdersPage> {
bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    Provider.of<OrderList>(
      context,
      listen: false,
    ).loadOrders().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus pedidos"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      drawer: const AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.blue[200],
              ),
            )
          : ListView.builder(
              itemCount: orders.itemsCount,
              itemBuilder: (context, index) {
                return OrderWidget(order: orders.items[index]);
              },
            ),
    );
  }
}
