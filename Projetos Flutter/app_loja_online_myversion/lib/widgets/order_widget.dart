import 'package:flutter/material.dart';
import '../models/order.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatefulWidget {
  final Order order;
  const OrderWidget({super.key, required this.order});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text("R\$ ${widget.order.total!.toStringAsFixed(2)}"),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date!)
              ),
            trailing: IconButton(
              onPressed: (){
                setState(() {
                  _expanded = !_expanded;
                });
              }, 
              icon: Icon(Icons.add)),
          ),
          if(_expanded)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical:4),
            height: (widget.order.products.length) * 24.0 + 10,
            child: ListView(
              children: widget.order.products.map((product) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.title!),
                    Text("${product.quantity}x R\$ ${product.price}")
                  ],
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}