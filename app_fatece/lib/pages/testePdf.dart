import 'package:flutter/material.dart';

class TestePdf extends StatefulWidget {
  const TestePdf({super.key});

  @override
  State<TestePdf> createState() => _TestePdfState();
}

class _TestePdfState extends State<TestePdf> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Estrutura de Dados"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(child: Text("PDFS"),)
      ),
    );
  }
}
