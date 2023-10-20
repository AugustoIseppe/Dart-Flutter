import 'package:app_loja_online/tiles/category_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('products').get(), 
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {

          /* LIST TILE COM OS DIVISORES */
          var dividedTiles = ListTile.divideTiles(tiles: snapshot.data!.docs.map((doc) {
                  return CategoryTile(doc);
                }).toList(),
                color: Colors.grey
                ).toList();
          return ListView(
           /* Olhar category_tiles.dart -> responsável por criar os componetes dessa lista */
            children: dividedTiles
          );

          /* LISTTILE SEM OS DIVISORES */
          // return ListView(
          //  /* Olhar category_tiles.dart -> responsável por criar os componetes dessa lista */
          //   children:
          //      snapshot.data!.docs.map((doc) {
          //         return CategoryTile(doc);
          //       }).toList()
          
          }
       },
      );
  }
}