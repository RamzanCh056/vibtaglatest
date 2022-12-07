import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/constant.dart';

class InputField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String title;
  final IconData? sufIcon;
  final String? hintText;
  final TextEditingController controller;
  String textColor;
  String background;
  bool isObscure = false;
  bool enable = true;

  InputField({
    super.key,
    required this.title,
    this.hintText,
    required this.controller,
    this.validator,
    this.sufIcon,
    this.isObscure = false,
    this.enable=true,
    this.textColor = '#FFFFFF',
    this.background = '#FFFFFF',
  });

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: HexColor('${textColor}'),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Container(
          decoration: BoxDecoration(
            color: HexColor('${background}'),
            borderRadius: BorderRadius.circular(width * 0.04),
          ),
          child: TextFormField(

            controller: controller,
            decoration: InputDecoration(
              enabled: enable,
              suffixIcon: Icon(sufIcon),
              hintText: hintText,
              prefix: Padding(
                padding: EdgeInsets.only(left: width * 0.02),
              ),
              suffix: Padding(
                padding: EdgeInsets.only(left: width * 0.02),
              ),
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 59, 59, 59),
                fontWeight: FontWeight.bold,
              ),
              border: InputBorder.none,
            ),
            obscureText: isObscure,
              validator: validator,
          ),
        )
      ],
    );
  }
}
