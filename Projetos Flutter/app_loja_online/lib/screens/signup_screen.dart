import 'package:app_loja_online/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Criar Conta',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: 'Nome Completo',
                        border: OutlineInputBorder(),
                      ),
                      validator: (text) {
                        if (text!.isEmpty) return "Nome inválido";
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (text) {
                        if (text!.isEmpty || !text.contains('@'))
                          return "Email inválido";
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        hintText: 'Endereço',
                        border: OutlineInputBorder(),
                      ),
                      validator: (text) {
                        if (text!.isEmpty) {
                          return "Endereço inválido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _passController,
                      decoration: const InputDecoration(
                        hintText: 'Senha',
                        border: OutlineInputBorder(),
                      ),
                      validator: (text) {
                        if (text!.isEmpty || text.length < 6)
                          return "Senha inválida";
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: TextButton(
                          onPressed: () {
                            if(_formKey.currentState!.validate()) {
                            Map<String, dynamic> userData = {
                              "name": _nameController.text,
                              "email": _emailController.text,
                              "address": _addressController.text,
                              "pass": _passController.text,
                            };
                            model.signUp(
                              userData: userData,
                              pass: _passController.text,
                              onSuccess: onSuccess,
                              onFail: onFail,
                            );
                            }
                            _clearFields();
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.signpost_outlined,
                                color: Colors.white,
                              ),
                              Padding(padding: EdgeInsets.all(5)),
                              Text(
                                'Cadastrar',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: const Text('Usuário logado com sucesso'),
      backgroundColor: Theme.of(context).primaryColor,
      duration: const Duration(seconds: 2)
      ),
      );
      Future.delayed(const Duration(seconds: 2)).then((value) {
        Navigator.of(context).pop();
      });
      
  }
  void onFail() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Erro ao cadastrar usuário. Tente novamente!'),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
      )
    );
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pop();
    });
  }
  void _clearFields(){
    _nameController.text = "";
    _emailController.text = "";
    _addressController.text = "";
    _passController.text = "";
  }
}
