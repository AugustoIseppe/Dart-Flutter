
import 'package:flutter/material.dart';

class Badgee extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;
  const Badgee({
    super.key,
    required this.child,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 4,
          right: 8,
          child: Container(
            width: 15,
            constraints: BoxConstraints(
              maxWidth: 16,
              minHeight: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
            ),
          ),
        )
      ],
    );
  }
}
