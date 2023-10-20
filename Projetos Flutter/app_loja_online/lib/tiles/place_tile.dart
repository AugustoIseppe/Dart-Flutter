import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';


class PlaceTile extends StatelessWidget {
  final DocumentSnapshot snapshot;
  PlaceTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          SizedBox(
            height: 170.0,
            child: Image.network(snapshot['image'], fit: BoxFit.cover,)
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(snapshot['title'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text(snapshot["address"])
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor
                ),
                onPressed: (){
                  // launchUrl(Uri.parse("https://www.google.com/maps/search/?api=`&query$"));
                }, 
                child: Text("Ver no mapa")),
              SizedBox(width: 5,),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor
                ),
                onPressed: (){}, child: Text("Ligar")),
            ],
          )
        ],
      ),
    );
  }
}