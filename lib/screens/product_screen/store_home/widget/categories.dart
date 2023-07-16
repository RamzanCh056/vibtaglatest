import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Categories extends StatelessWidget {
  final String ? icon;
  final String ? text;
  const Categories({required this.icon,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      // padding: EdgeInsets.all(15),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon!),
          SizedBox(width: 5,),
          Text(text!,style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}