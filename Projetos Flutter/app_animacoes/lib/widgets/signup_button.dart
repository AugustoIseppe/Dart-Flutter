import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
      child: InkWell(
        onTap: () {},
        child: const Text(
          "Não tem uma conta? Cadastre-se!",
          style: TextStyle(color: Colors.white, fontSize: 13, letterSpacing: 0.9),
        ),
      ),
    );
  }
}
