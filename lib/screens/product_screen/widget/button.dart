import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  final Widget ? child;
  final Color ? color;
  final VoidCallback ? onPressed;
  const Button({this.child, this.color = const Color(0xFFFF9200),required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: color),
      onPressed: onPressed,
      child: child!
    );
  }
}