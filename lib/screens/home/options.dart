import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/chat/chat_Tile.dart';
import 'package:vibetag/screens/chat/chat_details.dart';

import '../../utils/constant.dart';

Options({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: HexColor('#F0F0F0'),
          insetPadding: EdgeInsets.only(
            top: 0,
            right: 0,
            left: width * 0.4,
            bottom: height * 0.47,
          ),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          iconPadding: EdgeInsets.zero,
          content: Container(
            width: width * 0.2,
            height: height * 0.25,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width * 0.1,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius(5),
                      color: darkGrayNew,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.07,
                        child: Image.asset(
                          'assets/icons/lightning.png',
                          width: width * 0.07,
                          height: width * 0.07,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          'Boost Your Vibes',
                          style: TextStyle(
                            fontSize: textMed,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.07,
                        child: Image.asset(
                          'assets/icons/setting.png',
                          width: width * 0.07,
                          height: width * 0.07,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          'Setting',
                          style: TextStyle(
                            fontSize: textMed,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.07,
                        child: Image.asset(
                          'assets/icons/help.png',
                          width: width * 0.07,
                          height: width * 0.07,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          'Help',
                          style: TextStyle(
                            fontSize: textMed,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.07,
                        child: Image.asset(
                          'assets/icons/write.png',
                          width: width * 0.07,
                          height: width * 0.07,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          'Support',
                          style: TextStyle(
                            fontSize: textMed,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
