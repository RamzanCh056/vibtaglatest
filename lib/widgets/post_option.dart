import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/provider/userProvider.dart';

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
      width: width * 0.1,
      height: height * 0.1,
      // padding: spacing(
      //   horizontal: width * 0.01,
      //   vertical: 7,
      // ),
      decoration: BoxDecoration(
        color: HexColor('#F0F0F0'),
        borderRadius: BorderRadius.circular(
          20
         // width * 0.03,
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
            child: SvgPicture.asset(
              '${icon}',
              color: iconColor,
            ),
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Container(
            width: width * 0.28,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
