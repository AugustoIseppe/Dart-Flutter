import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/order.dart';

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
            title: Text("R\$ ${widget.order.total.toStringAsFixed(2)}"),
            subtitle:
                Text(DateFormat("dd/MM/yyyy hh:mm").format(widget.order.date)),
            trailing: IconButton(
              icon: const Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
                ),
                height: (widget.order.products.length * 24.0) +40,
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                child: ListView(
                  children: widget.order.products.map((product) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.title,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Lato",),
                              textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 10,),
                        Text("${product.quantity} x R\$${product.price}", style: TextStyle(color: Colors.grey[600], fontSize: 20),)
                      ],
                    );
                  }).toList(),
                ),
              ),
            )
        ],
      ),
    );
  }
}
