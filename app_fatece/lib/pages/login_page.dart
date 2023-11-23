import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var dummyPassword = "123456";
  var dummyEmail = "teste@teste.com";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/back.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.5),
            ),
          ),
          Center(
            child: Container(
              width: 300,
              height: 460,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue.withOpacity(0.7),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /* FORMULÁRIO */
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  border: OutlineInputBorder(),
                                  labelText: "E-mail",
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Inform seu e-mail!";
                                  }
                                  if (value != dummyEmail) {
                                    return "E-mail inválido";
                                  }
                                  if (!value.contains("@")) {
                                    return "E-mail inválido";
                                  }
                                  return null;
                                  // var dummyPassword = "123456";
                                  // var dummyEmail = "teste@teste.com";
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  border: OutlineInputBorder(),
                                  labelText: "Senha",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Informe sua senha!";
                                  }
                                  if (value != dummyPassword) {
                                    return "Senha inválida";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.HOME_PAGE, (route) => false);
                          }
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue[800],
                            elevation: 30,
                            fixedSize: const Size(120, 50)),
                        child: Text("Entrar", style: GoogleFonts.lato(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Esqueci minha senha!", style: GoogleFonts.lato(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 50,
            left: 50,
            child: Image.asset(
              "images/logo_fatece.png",
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
