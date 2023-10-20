import 'package:cloud_firestore/cloud_firestore.dart';

class FormModel {
  Map<String, dynamic> dadosUsuario = {};
  /* Atributos */
  String? id;
  String? email;
  String? nome;
  String? telefone;
  String? senha;

  FormModel();

  FormModel.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.id;
    email = snapshot.get('email');
    nome = snapshot.get('nome');
    telefone = snapshot.get('telefone');
    senha = snapshot.get('senha');
  }

  Map<String, dynamic> toResumedMap() {
    return {"email": email, "senha": senha, "nome": nome, "telefone": telefone};
  }

  //Função para salvar os dados no firebase
  void salvarDadosNoFirebase(Map<String, dynamic> dadosUsuario) {
    //instancia do banco de dados
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("testeUsuarios").doc(id).set(dadosUsuario);
  }


}
