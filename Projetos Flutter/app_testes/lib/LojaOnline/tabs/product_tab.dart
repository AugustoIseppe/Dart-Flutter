import 'package:flutter/material.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key});

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreenAccent[700],
      child: Center(
        child: Text("PÁGINA\n PRODUTOS", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
      ),
    );
  }
}