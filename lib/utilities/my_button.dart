import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String name;
  final Color color;
  VoidCallback onPressed;
  MyButton({super.key, required this.name, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
    );
  }
}
