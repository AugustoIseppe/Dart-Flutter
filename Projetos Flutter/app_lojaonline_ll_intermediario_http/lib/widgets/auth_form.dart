import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Map<String, String> _authData = {
    "email": "",
    "password": "",
  };
  AuthMode _authMode = AuthMode.Login;

  bool _isLogin() => _authMode == AuthMode.Login;
  bool _isSignup() => _authMode == AuthMode.Signup;

  _submit() {

    final isValid = _formKey.currentState?.validate ?? false;
    if(isValid == false) {
      return;   
    }
    setState(() => _isLoading = true);

    _formKey.currentState?.save;

    if(_isLogin()) {
      //Login
    } else {
      //Registrar
    }

    setState(() => _isLoading = false);
  }
  void _switchAuthMode () {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.Signup;
      } else { 
        _authMode = AuthMode.Login;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final componentSize = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.only(top: 20),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        width: componentSize.width * 0.85,
        height: _isLogin() ? 310 : 400,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (email) => _authData["email"] = email ?? " ",
                decoration: const InputDecoration(
                  labelText: "E-mail",
                ),
                keyboardType: TextInputType.emailAddress,
                // ignore: no_leading_underscores_for_local_identifiers
                validator: (_email) {
                  final email = _email ?? "";
                  if (email.trim().isEmpty || !email.contains("@")) {
                    return "E-mail inválido";
                  }
                  return null;
                },
              ),
              TextFormField(
                onSaved: (password) => _authData["password"] = password ?? "",
                decoration: const InputDecoration(
                  labelText: "Senha",
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: _passwordController,
                // ignore: no_leading_underscores_for_local_identifiers
                validator: (_password) {
                  final password = _password ?? "";
                  if (password.isEmpty || password.length <= 5) {
                    return "A senha deve conter no mínimo 6 caracteres";
                  }
                  return null;
                },
              ),
              /* Abaixo somente será renderizado se o _authMode for == AuthMode.Signup */
              if (_isSignup())
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Confirmar Senha",
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  // ignore: no_leading_underscores_for_local_identifiers
                  validator: _isLogin()
                      ? null
                      : (_password) {
                          final password = _password ?? "";
                          if (password != _passwordController.text) {
                            return "Senhas não compatíveis";
                          }
                          return null;
                        },
                ),
              const SizedBox(
                height: 20,
              ),
              if (_isLoading)
              const CircularProgressIndicator(backgroundColor: Colors.black,)
              else
              FilledButton(
                onPressed: _submit,
                style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 30)),
                child: Text(
                  _isLogin() ? "Entrar" : "Cadastrar",
                  style: const TextStyle(fontFamily: "Anton", letterSpacing: 1),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: _switchAuthMode,
                child: Text(_isLogin() ? "CADASTRAR" : "JA POSSUI CONTA?"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
