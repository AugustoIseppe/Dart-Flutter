import 'package:app_lojaonline_ll/models/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl!),
      ),
      title: Text(product.title!),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: Colors.yellow[600],),),
            IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.redAccent,),),
          ],
        ),
      ),
    );
  }
}
