import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';

import '../utils/constant.dart';

class postOption extends StatelessWidget {
  final String title;
  final String icon;
  final Color iconColor;


  postOption({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      width: width * 0.2,
      height: height * 0.1,
      padding: spacing(
        horizontal: width * 0.01,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: HexColor('#F0F0F0'),
        borderRadius: BorderRadius.circular(
          width * 0.03,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: width * 0.1,
            height: width * 0.1,
            padding: spacing(
              horizontal: width * 0.02,
              vertical: width * 0.02,
            ),
            decoration: BoxDecoration(
              color: HexColor('#FFFFFF'),
              borderRadius: BorderRadius.circular(
                width * 0.1,
              ),
            ),
            child: SvgIcon(
              '${icon}',
              color: iconColor,
            ),
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
