import 'package:app_animacoes/widgets/form_container.dart';
import 'package:flutter/material.dart';

import '../widgets/signup_button.dart';
import '../widgets/stagger_animation.dart';

class AppAnimacoes extends StatefulWidget {
  const AppAnimacoes({super.key});

  @override
  State<AppAnimacoes> createState() => _AppAnimacoesState();
}

class _AppAnimacoesState extends State<AppAnimacoes>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  // @override
  // void dispose() {
  //   _animationController!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage("assets/images/logo-montanha.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.96),
                BlendMode.dstATop,
              )),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 350, bottom: 32),
                    child: FormContainer(),
                  ),
                ),
              ],
            ),
            StaggerAnimation(
              controller: _animationController!,
            ),
            const SignUpButton(),
          ],
        ),
      ),
    );
  }
}
