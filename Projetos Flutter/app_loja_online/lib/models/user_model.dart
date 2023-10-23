import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
/* ScopedModel -> deixa as funções serem acessíceis de qualquer lugar do App */

class UserModel extends Model {
  /* FirebaseAuth auth -> pegar a instancia do firebase */
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /* UserCredential -> será o usuário que estiver logado no momento */
  /* se não tiver nenhum usuário logado o userCredential será null */
  /* se estiver logado o userCredential terá o id do usuário logado */
  User? firebaseUser;

  /* Map userData -> aqui será armazenado os principais dados do usuario */
  Map<String, dynamic> userData = {};

  bool isLoading = false;


  /* Método para acessar o UserModel de qualquer lugar!! */
  static UserModel of(BuildContext context) => ScopedModel.of<UserModel>(context);


  //aqui recupera os dados qdo o app é iniciado
  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    _loadCurrentUser();
  }

  /* Função para criar um usuário */
  void signUp(
      {@required Map<String, dynamic>? userData,
      @required String? pass,
      @required VoidCallback? onSuccess,
      @required VoidCallback? onFail}) async {
    //signUp -> Inscrever-se -> método para criar um usuário
    isLoading = true;
    notifyListeners();
    _firebaseAuth
        .createUserWithEmailAndPassword(
            email: userData!["email"], password: pass!)
        .then((user) async {
      //funçao then -> caso de certo a criação do usuário
      firebaseUser = user as User;
      //salvar os dados do usuário no firebase
      await _saveUserData(userData);
      onSuccess!();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      //função catchError -> caso de errado a crição do usuário
      onFail!();
      isLoading = false;
      notifyListeners();
    });
  }
  /* FIM -> Função para criar um usuário */

  void singIn(
      {@required String? email,
      @required String? pass,
      @required VoidCallback? onSuccess,
      @required VoidCallback? onFail}) async {
    isLoading = true;
    notifyListeners();

    _firebaseAuth
        .signInWithEmailAndPassword(
      email: email!,
      password: pass!,
    )
        .then((user) async {
      firebaseUser = user as User;
      // await _loadCurrentUser();
      onSuccess!();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail!();
      isLoading = false;
      notifyListeners();
    });
  }

  /* Função para deslogar usuário */
  void signOut() async {
    await _firebaseAuth.signOut(); //deslogar usuário
    // ignore: prefer_collection_literals
    userData = Map(); //resetando os dados do usuário
    firebaseUser = null; //indica que não tem ninguem logado
    notifyListeners();
  }
  /* Funçao para recuperaçao de senha */
  void recoverPass(String email) {
    _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  bool isLoggedIn() {
    return firebaseUser != null;
  }

  /* Função _saveUserData -> responsável por criar o usuário dentro do firebase */
  Future _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await FirebaseFirestore.instance
        .collection("users") //irá salvar na collection "users"
        .doc(firebaseUser!.uid) //irá salvar com  o id do usuário
        .set(userData); //dados dos usuário salvos
  }

  Future<void> _loadCurrentUser() async {
    //se firebaseUser for null, busca o usuário atual
    firebaseUser ??= _firebaseAuth.currentUser;
     
    if (firebaseUser != null) {
      DocumentSnapshot<Map<String, dynamic>> docUser = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(firebaseUser!.uid)
          .get();
      userData = docUser.data()!;
    }
    notifyListeners();
  }


}

//1 -> criar a funcao para criar o usuário
//2 -> fazer o link do código com os dados da tabela(TextField) -> será chamado dentro do botao Criar Conta
