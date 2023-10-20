import 'package:app_loja_online/datas/cart_product.dart';
import 'package:app_loja_online/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  UserModel? user;
  List<CartProduct> products = [];
  String? couponCode;
  var discountPercentage;
  final _firebaseFirestore = FirebaseFirestore.instance;

  CartModel(this.user) {
    if (user!.isLoggedIn()) _loadCarItems();
  }
  bool isLoading = false;

  /* Método para acessar o CartModel de qualquer lugar!! */
  static CartModel of(BuildContext context) =>
      ScopedModel.of<CartModel>(context);

  void addCartItem(CartProduct cartProduct) {
    products.add(cartProduct);
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.firebaseUser!.uid)
        .collection('cart')
        .add(cartProduct.toMap())
        .then((doc) {
      cartProduct.cid = doc.id;
    });
    notifyListeners();
  }

  void removeCartItem(CartProduct cartProduct) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.firebaseUser!.uid)
        .collection('cart')
        .doc(cartProduct.cid)
        .delete();

    products.remove(cartProduct);
    notifyListeners();
  }

  void decrementProduct(CartProduct cartProduct) {
    cartProduct.quantity = cartProduct.quantity! - 1;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.firebaseUser!.uid)
        .collection('cart')
        .doc(cartProduct.cid)
        .update(cartProduct.toMap());

    notifyListeners();
  }

  void incrementProduct(CartProduct cartProduct) {
    cartProduct.quantity = cartProduct.quantity! + 1;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.firebaseUser!.uid)
        .collection('cart')
        .doc(cartProduct.cid)
        .update(cartProduct.toMap());

    notifyListeners();
  }

  void setCoupon(String couponCode, int discountPercentage) {
    this.couponCode = couponCode;
    this.discountPercentage = discountPercentage;
  }
  
  double getProductsPrice() {
    double price = 0.0;
    for (CartProduct c in products) {
      if (c.productData != null) 
        price += c.quantity! * c.productData!.price!;
    }
    return price;
  }

  void _loadCarItems() async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.firebaseUser!.uid)
        .collection('cart')
        .get();

    products = query.docs.map((doc) => CartProduct.fromDocument(doc)).toList();
    notifyListeners();
  }


  double getDiscount() {
    discountPercentage = 5;
    return getProductsPrice() * discountPercentage / 100;
  }

  double getShipPrice() {
    return 9.99;
  }

  void updatePrices() {
    notifyListeners();
  }

  Future<String?> finishOrder() async {
    // if (products.isEmpty) return null;

    isLoading = true;
    notifyListeners();

    double productsPrice = getProductsPrice();
    double shipePrice = getShipPrice();
    double discount = getDiscount();


    //Salvar  os dados no firebase e pegar o id(referencia)
    DocumentReference documentReference =
        await FirebaseFirestore.instance.collection("orders").add(
        {
      "clientId": user!.firebaseUser!.uid,
      "products": products.map((cartProduct) => cartProduct.toMap()).toList(),
      "shipPrice": shipePrice,
      "productsPrice": productsPrice,
      "discount": discount,
      "totalPrice": productsPrice - discount + shipePrice,
      "status": 1
        }
    );

    //Recupera o Id
    await _firebaseFirestore
        .collection("users")
        .doc(user!.firebaseUser!.uid)
        .collection("orders")
        .doc(documentReference.id)
        .set({"orderId": documentReference.id});

    //deletar o itens do carrinho
    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection("users")
        .doc(user!.firebaseUser!.uid)
        .collection("cart")
        .get();

    for (DocumentSnapshot doc in querySnapshot.docs) {
      doc.reference.delete();
    }
    products.clear();

    couponCode = null;
    discountPercentage = 0;

    isLoading = false;
    notifyListeners();

    return documentReference.id;
  }
}
