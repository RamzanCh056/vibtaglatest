import 'package:flutter/material.dart';
import '../utils/constant.dart';

class InputField2 extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  InputField2({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.007,
        ),
        Container(
          width: width * 0.8,
          height: height * 0.04,
          decoration: BoxDecoration(
              border: Border.all(
                width: width * 0.005,
                color: Color.fromARGB(255, 109, 104, 104),
              ),
              borderRadius: BorderRadius.circular(
                width * 0.1,
              )),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                bottom: 15,
              ),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14,
              ),
              prefix: const Padding(
                padding: EdgeInsets.only(
                  left: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
