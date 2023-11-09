import 'package:app_loja_online/models/user_model.dart';
import 'package:app_loja_online/screens/login_screen.dart';
import 'package:app_loja_online/tiles/order_tiles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    if(UserModel.of(context).isLoggedIn()) {

      //SE O USUÁRIO ESTIVER LOGADO, ENTRA NESTE CÓDIGO -> PAGINA COM OS PRODUTOS

      //1-> primeiro passo -> obter o id do usuário
      String idUsuario = UserModel.of(context).firebaseUser!.uid;
      //QuerySnapshot -> para obter mais de um documento
      //DocumentSnapshot -> para obter apenas um documento
      return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection("users").doc(idUsuario).collection("orders").get(), 
        builder: (context, snapshot) {
          //se não tiver dados a serem carregados, será exibido o circular progress indicator
          if(!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
          //se tiver dados, será exibido a listView com os produtos
            return ListView(
              children: snapshot.data!.docs.map((produtosUsuario) => OrderTile(produtosUsuario.id)).toList().reversed.toList(),
            );
          }
        },
        );
    } else {

      //SE O USUÁRIO NÃO ESTIVER LOGADO, ENTRA NESTE CÓDIGO -> PÁGINA PARA FAZER O LOGIN
      return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.view_list,
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
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
    }
  }
}