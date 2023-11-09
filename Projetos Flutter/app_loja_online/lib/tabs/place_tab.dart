import 'package:app_loja_online/tiles/place_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlacesTab extends StatelessWidget {
  const PlacesTab({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    DocumentSnapshot -> para recuperar apenas um documento
    QuerySnapshot -> para recuperar mais de um documento
     */
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection("places").get(), 
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else { 
          return ListView(
            children: snapshot.data!.docs.map((doc) => PlaceTile(doc)).toList(),
          );
        }
      },);
  }
}