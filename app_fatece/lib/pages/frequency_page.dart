import 'package:flutter/material.dart';

class FrequencyPage extends StatefulWidget {
  const FrequencyPage({super.key});

  @override
  State<FrequencyPage> createState() => _FrequencyPageState();
}

class _FrequencyPageState extends State<FrequencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frequência"),
        centerTitle: true,
      ),
      body: Center(child: Text("This is Frequency Page"),),
    );
  }
}