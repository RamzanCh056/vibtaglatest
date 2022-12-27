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
  bool feeds = true;
  bool darkMode = false;
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: HexColor('#F0F0F0'),
          insetPadding: EdgeInsets.only(
            top: 0,
            right: 15,
            left: width * 0.4,
            bottom: height * 0.4,
          ),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          iconPadding: EdgeInsets.zero,
          content: Container(
            width: width * 0.2,
            height: height * 0.35,
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
                        width: width * 0.06,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/boast.svg',
                          width: width * 0.06,
                          height: width * 0.06,
                          color: grayMed,
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
                        width: width * 0.06,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/setting.svg',
                          width: width * 0.06,
                          height: width * 0.06,
                          color: grayMed,
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
                        width: width * 0.06,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/help.svg',
                          width: width * 0.06,
                          height: width * 0.06,
                          color: grayMed,
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
                        width: width * 0.06,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/support.svg',
                          width: width * 0.06,
                          height: width * 0.06,
                          color: grayMed,
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
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.06,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/star.svg',
                          width: width * 0.06,
                          height: width * 0.06,
                          color: grayMed,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              'Your Feeds',
                              style: TextStyle(
                                fontSize: textMed,
                              ),
                            ),
                          ),
                          Switch(
                              value: feeds,
                              onChanged: (value) {
                                setState(() {
                                  feeds = !feeds;
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.06,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/darkmode.svg',
                          width: width * 0.06,
                          height: width * 0.06,
                          color: grayMed,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              'Dark mode',
                              style: TextStyle(
                                fontSize: textMed,
                              ),
                            ),
                          ),
                          Switch(
                              value: darkMode,
                              onChanged: (value) {
                                setState(() {
                                  darkMode = !darkMode;
                                });
                              })
                        ],
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
