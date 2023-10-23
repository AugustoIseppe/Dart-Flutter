import 'package:app_loja_online/models/user_model.dart';
import 'package:app_loja_online/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text(
            'Entrar',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ));
              },
              child: const Text(
                'Criar Conta',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
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
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'E-mail',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text!.isEmpty || !text.contains("@"))
                            // ignore: curly_braces_in_flow_control_structures
                            return "E-mail inválido";
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
                            // ignore: curly_braces_in_flow_control_structures
                            return "Senha inválida";
                          return null;
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_emailController.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Insira seu E-mail para recuperação!'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 5),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                              content: Text('Link para recuperação enviado para o e-mail ${_emailController.text}'),
                              backgroundColor: Theme.of(context).primaryColor,
                              duration: const Duration(seconds: 5),
                            ));
                          }
                        } ,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Esqueci minha senha!'),
                        ),
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
                              if (_formKey.currentState!.validate()) {}
                              model.singIn(
                                email: _emailController.text,
                                pass: _passController.text,
                                onSuccess: onSuccess,
                                onFail: onFail,
                              );
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
                                  'Entrar',
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
        ));
  }

  void onSuccess() {
    Navigator.of(context).pop();
  }

  void onFail() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Falha ao entrar!'),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
    ));
  }
}
