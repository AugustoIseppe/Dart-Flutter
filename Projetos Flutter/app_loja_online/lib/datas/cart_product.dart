import 'package:app_loja_online/datas/product_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartProduct {
  String? cid; //cid -> cart id
  String? category;
  String? pid; //product id
  int? quantity;
  String? size;

  ProductData? productData;
  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot documentSnapshot) {
    cid = documentSnapshot.id;
    category = documentSnapshot.get('category');
    pid = documentSnapshot.get('pid');
    quantity = documentSnapshot.get('quantity');
    size = documentSnapshot.get('size');
  }

  Map<String, dynamic> toMap() {
    return {
      'category' : category,
      'pid' : pid,
      'quantity' : quantity,
      'size' : size,
      'pruduct' : productData?.toResumedMap(),

    };
  }
}