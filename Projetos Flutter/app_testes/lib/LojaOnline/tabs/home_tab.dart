import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {


  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: const Center(
        child: Text("PÁGINA\n INICIAL", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
    );
  }
}