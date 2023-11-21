import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// ignore: must_be_immutable
class Testepdf extends StatelessWidget {
  String title;
  Testepdf({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0, left: 8),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.png"),
              backgroundColor: Colors.white,
              maxRadius: 16,
            ),
          ),
        ],
      ),
      body: SfPdfViewer.asset("assets/estrutura.pdf"),
    );
  }
}
