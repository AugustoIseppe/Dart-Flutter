import 'package:app_loja_online/models/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        title: Text(
          "Cupom de Desconto",
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.grey[700]),
        ),
        leading: const Icon(Icons.card_giftcard), //icone a esquerda
        trailing: const Icon(Icons.add),
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite seu cupom',
              ),
              initialValue: CartModel.of(context).couponCode ?? "",
              onFieldSubmitted: (cupomDesconto) {
                FirebaseFirestore.instance
                    .collection('coupons')
                    .doc(cupomDesconto)
                    .get()
                    .then((docSnap) {
                  if (docSnap.data() != null) {
                      CartModel.of(context).setCoupon(cupomDesconto, docSnap.data()!["percent"]);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Desconto de ${docSnap.data()!["percent"]}% aplicado'),
                        backgroundColor: Colors.greenAccent[700],
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  } else {
                    CartModel.of(context).setCoupon("0", 0);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Cupom Inválido'),
                        backgroundColor: Colors.red[700],
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                });
              },
            ),
          ),
        ], //icone à direita
      ),
    );
  }
}
