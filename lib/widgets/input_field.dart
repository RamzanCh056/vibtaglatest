import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/constant.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  String textColor;
  String hintColor;
  String background;
  int maxLine;
  bool isObscure;
  bool haveTitle;

  InputField({
    super.key,
    this.title = '',
    required this.hintText,
    required this.controller,
    this.isObscure = false,
    this.haveTitle = false,
    this.textColor = '#FFFFFF',
    this.hintColor = '#AFAFAF',
    this.background = '#FFFFFF',
    this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        haveTitle
            ? Text(
                title,
                style: TextStyle(
                  color: HexColor('${textColor}'),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Container(),
        haveTitle
            ? SizedBox(
                height: height * 0.01,
              )
            : Container(),
        Container(
          decoration: BoxDecoration(
            color: HexColor('${background}'),
            borderRadius: BorderRadius.circular(width * 0.04),
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              prefix: Padding(
                padding: EdgeInsets.only(left: width * 0.02),
              ),
              suffix: Padding(
                padding: EdgeInsets.only(left: width * 0.02),
              ),
              hintStyle: TextStyle(
                color: HexColor('${hintColor}'),
                fontWeight: FontWeight.bold,
              ),
              border: InputBorder.none,
            ),
            maxLines: maxLine,
            obscureText: isObscure,
          ),
        )
      ],
    );
  }
}
