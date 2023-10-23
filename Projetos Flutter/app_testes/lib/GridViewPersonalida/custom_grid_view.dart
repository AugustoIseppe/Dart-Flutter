import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyAppCustomGridView extends StatelessWidget {
  const MyAppCustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.blue[500],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Olá,\nAugusto", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            IconButton(onPressed: () {}, icon: Icon(Icons.account_circle, size: 35,)),
            IconButton(onPressed: () {}, icon: Icon(Icons.refresh_sharp, size: 35,))
          ],
        ),
        toolbarHeight: 80.0,
      ),
      body: Container(
        color: Colors.blue[200],
        child: MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: 14,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      Image.asset("images/image${index + 1}.jpg"),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.black
                              ),
                                textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
