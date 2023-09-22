import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'dart:async';

class GifPage extends StatelessWidget {

  final Map _gifData;
  GifPage(this._gifData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gifData['title']),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              _share();
            }, 
          icon: Icon(Icons.share)),
        ],
        
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Center(
          child: Image.network(_gifData["images"]["fixed_height"]["url"], width: 300, height: 300,),
        )
        ),
    );
  }

  Future<void> _share() async {
    await FlutterShare.share(
        title: 'Compartilhar Gif',
        text: 'Compartilhe com quem desejar essa gif...',
        linkUrl: _gifData["images"]["fixed_height"]["url"],
        chooserTitle: _gifData["title"]);
  }
}