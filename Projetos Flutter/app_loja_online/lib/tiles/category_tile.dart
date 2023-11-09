import 'package:app_loja_online/screens/category_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {

  final DocumentSnapshot snapshot;
  const CategoryTile(this.snapshot, {super.key});

  @override
  Widget build(BuildContext context) {

    /* ARQUIVO RESPONSÁVEL POR CRIAR CADA ELEMENTO DA LISTA DE PRODUTOS */
    return ListTile(
      leading: CircleAvatar(
        radius: 20.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot.get('icon')),
      ),
      title: Text(snapshot.get('title'), style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 17,
        fontWeight: FontWeight.w500
      ),),
      trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).primaryColor,),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CategoryScreen(snapshot))
        );
      },
    );
  }
}