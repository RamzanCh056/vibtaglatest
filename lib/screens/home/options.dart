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
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          insetPadding: EdgeInsets.only(
            top: 0,
            right: 15,
            left: width * 0.5,
            bottom: height * 0.45,
          ),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          iconPadding: EdgeInsets.zero,
          content: Container(
            width: width * 0.18,
            height: height * 0.32,
            decoration: BoxDecoration(
              color: whitePrimary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
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
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/boast.svg',
                          width: width * 0.045,
                          height: width * 0.045,
                          color: grayMed,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: const Text(
                          'Boost Your Vibes',
                          style: TextStyle(
                            fontSize: 14,
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
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/setting.svg',
                          width: width * 0.045,
                          height: width * 0.045,
                          color: grayMed,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: const Text(
                          'Setting',
                          style: TextStyle(
                            fontSize: 14,
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
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/help.svg',
                          width: width * 0.045,
                          height: width * 0.045,
                          color: grayMed,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: const Text(
                          'Help',
                          style: TextStyle(
                            fontSize: 14,
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
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/support.svg',
                          width: width * 0.045,
                          height: width * 0.045,
                          color: grayMed,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: const Text(
                          'Support',
                          style: TextStyle(
                            fontSize: 14,
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
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/star.svg',
                          width: width * 0.045,
                          height: width * 0.045,
                          color: grayMed,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            child: const Text(
                              'Your Feeds',
                              style: TextStyle(
                                fontSize: 14,
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
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/menu/darkmode.svg',
                          width: width * 0.045,
                          height: width * 0.045,
                          color: grayMed,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            child: const Text(
                              'Dark mode',
                              style: TextStyle(
                                fontSize: 14,
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
