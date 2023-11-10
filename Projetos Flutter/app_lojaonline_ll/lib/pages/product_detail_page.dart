// import 'package:app_loja_online2/models/product.dart';
import 'package:app_lojaonline_ll/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    //Utilizando rotas nomeadas
    return Scaffold(
        appBar: AppBar(
          title: Text(product.title!),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      product.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                "R\$ ${product.price!}",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Lato"),
              ),
              Container(
                child: Text(product.description!, style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
              )
            ],
          ),
        ));
  }
}
