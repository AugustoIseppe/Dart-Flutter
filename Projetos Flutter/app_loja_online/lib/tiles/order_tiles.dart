import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String? orderId;
  const OrderTile(this.orderId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: StreamBuilder<DocumentSnapshot>(
          //.get() -> nao atualiza em tempo real, pois retorna um Future
          //.snapshots() -> atualiza em tempo real (do tipo Strem)
          stream: FirebaseFirestore.instance
              .collection('orders')
              .doc(orderId)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              //se nao tiver dados, retornatá o CircularProgressIndicator
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              //caso tenha algum tipo de dado, retornará este conteudo
                int status = snapshot.data!["status"];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Código do Pedido: ${snapshot.data!.id}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    _buildProductsText(snapshot.data!),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10,),
                  const Text('Status do Pedido:', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCircle("1", "Em preparação", status, 1),
                      Container(
                        height: 1,
                        width: 40.0,
                        color: Colors.grey[400],
                      ),
                      _buildCircle("2", "Enviado", status, 2),
                      Container(
                        height: 1,
                        width: 40.0,
                        color: Colors.grey[400],
                      ),
                      _buildCircle("3", "Entregue", status, 3)
                    ],
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  String _buildProductsText(DocumentSnapshot snapshot) {
    String text = "Descrição: \n";
    //LinkedHashMap -> é o tipo de lista do firebase
    for (LinkedHashMap p in snapshot["products"]) {
      text +=
          "${p["quantity"]} x ${p["pruduct"]["title"]} (R\$ ${p["pruduct"]["price"].toString()})\n";
    }
    text += "Total: R\$ ${snapshot["totalPrice"].toString()}";
    return text;
  }

  _buildCircle(String title, String subtitle, int status, int thisStatus) {
    Color backColor;
    Widget child;

    if (status < thisStatus) {
      backColor = Colors.grey;
      child = Text(
        title,
        style: const TextStyle(color: Colors.white),
      );
    } else if (status == thisStatus) {
      backColor = Colors.blue;
      child = Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          )
        ],
      );
    } else {
      backColor = Colors.green;
      child = const Icon(Icons.check);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 20.0,
            backgroundColor: backColor,
            child: child,
          ),
          Text(subtitle)
        ],
      ),
    );
  }
}
