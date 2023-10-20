import 'package:app_loja_online/models/cart_model.dart';
import 'package:app_loja_online/models/user_model.dart';
import 'package:app_loja_online/screens/login_screen.dart';
import 'package:app_loja_online/screens/order_screen.dart';
import 'package:app_loja_online/tiles/cart_tile.dart';
import 'package:app_loja_online/widgets/cart_button.dart';
import 'package:app_loja_online/widgets/cart_price.dart';
import 'package:app_loja_online/widgets/discount_card.dart';
import 'package:app_loja_online/widgets/frete_card.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Meu Carrinho",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                int p = model.products.length;
                return Text(
                  "${p} ${p == 1 ? "Item" : "Itens"}",
                  style: const TextStyle(color: Colors.white),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: CartButton(),
      body: ScopedModelDescendant<CartModel>(
        builder: (context, child, model) {
          if (model.isLoading && UserModel.of(context).isLoggedIn()) {
            /* Enquanto carrega os itens com o CircularProgressIndicator estará ativo */
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!UserModel.of(context).isLoggedIn()) {
            /* Se o usuário estiver deslgoado, será exibido este trecho de código */
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_shopping_cart,
                    size: 80.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    "Faça o login para adicionar produtos ao carrinho",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),
                        textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            );
          } else if ( model.products.length == 0) {
            /* Se o carrinho estiver vazio, este código será executado */
            return  Center(
              child: Text('Carrinho vazio',style:  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            );
          } else {
            return ListView(
              children: [
                Column(
                  children: model.products.map((product) {
                    return CartTile(product);
                  }).toList()
                ),
                DiscountCard(),
                FreteCard(),
                CartPrice(() async {
                  String? orderId = await model.finishOrder();
                  if (orderId!=null) Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OrderScreen(orderId),));;
                }),
              ],
            );
          }
        },
      ),
    );
  }
}
