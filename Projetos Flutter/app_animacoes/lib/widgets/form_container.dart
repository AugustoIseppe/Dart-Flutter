import 'package:flutter/material.dart';

import 'input_field.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: const Form(
        child: Column(
          children: [
            InputField(hint: "Username", obscure: false, icon: Icons.person,),
            InputField(hint: "Password", obscure: false, icon: Icons.lock,),
          ],
        ),
      ),
    );
  }
}
