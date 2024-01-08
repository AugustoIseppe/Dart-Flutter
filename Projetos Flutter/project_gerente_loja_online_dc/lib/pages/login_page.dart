import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[800]),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Icon(
                    Icons.account_box,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _username,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // errorText: snapshot.hasError
                          // ? snapshot.error as String
                          // : null),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return TextField(
                              controller: _password,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  errorText: snapshot.hasError
                                      ? snapshot.error as String
                                      : null),
                            );
                          }),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red[900],
                      shape: const LinearBorder(bottom: LinearBorderEdge())),
                  child: Text(
                    "Entrar".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: 3),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
