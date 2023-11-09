import 'package:flutter/material.dart';

class SimpleListViewBuilder extends StatefulWidget {
  const SimpleListViewBuilder({super.key});

  @override
  State<SimpleListViewBuilder> createState() => _SimpleListViewBuilderState();
}

class _SimpleListViewBuilderState extends State<SimpleListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple ListBiew.builder"),
        centerTitle: true,
      ),
      body: ListView.builder(
        //O ListView.builder já contem um scroll, sendo desnecessário envolve-lo em um SingleChildScrollView
        itemCount: 50,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 0),
            child: ListTile(
              title: Text("Olá indice, $index"),
              leading: Icon(Icons.check, color: Colors.blue[900],),
              // contentPadding: EdgeInsets.all(5),
              horizontalTitleGap: 5.0,
              iconColor: Colors.lightGreenAccent[300],
              // shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              tileColor: Colors.amber,
              textColor: Colors.redAccent[700],
              trailing: Icon(Icons.restore_from_trash_outlined),
            ),
          );
        },
      ),
    );
  }
}
