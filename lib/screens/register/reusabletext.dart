import 'package:flutter/material.dart';


class ReusableText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign? alignment;
  final double? spacing;
  const ReusableText(
      {Key? key,
        required this.title,
        this.color = Colors.white,
        this.size,
        this.weight,
        this.alignment,
        this.spacing,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alignment,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        letterSpacing: spacing,
        
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}

