import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/constant.dart';

class DropOptionField extends StatelessWidget {
  final String title;
  final String hinText;
  final Color bgColor;
  const DropOptionField({
    super.key,
    required this.title,
    required this.hinText,
    this.bgColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          child: Text(
            '${title}',
            style: TextStyle(
              fontSize: textSm,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.maxFinite,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.7,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '${hinText}',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                      left: 10,
                    ),
                  ),
                ),
              ),
              Container(
                width: width * 0.1,
                child: Table(
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: darkGray,
                        ),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                        ),
                      ),
                      children: const [
                        TableCell(
                          child: Icon(
                            Icons.keyboard_arrow_up_outlined,
                          ),
                        )
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: darkGray,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      children: const [
                        TableCell(
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
