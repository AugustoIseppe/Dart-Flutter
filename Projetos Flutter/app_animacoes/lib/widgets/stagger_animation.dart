import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {

  final AnimationController? controller;
  final Animation<double> buttonSqueeze;

  StaggerAnimation({super.key, 
    this.controller,
  }) : buttonSqueeze = Tween(
    begin: 320.0, end: 60.0
  ).animate(
    CurvedAnimation(
      parent: controller!, 
      curve: Interval(0.0, 0.150),
      )
  );
  


  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: InkWell(
        onTap: () {
          controller!.forward();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: buttonSqueeze.value,
            height: 60,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(227, 24, 106, 1.0),
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            child: const Text(
              "Sign In",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.3,
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller!,
    );
  }
}
