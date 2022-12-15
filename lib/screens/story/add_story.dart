import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/livestream/create%20stream/live.dart';
import '../../utils/constant.dart';

addStory({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: Colors.black,
          insetPadding: EdgeInsets.zero,
          contentPadding: spacing(
            horizontal: width * 0.04,
            vertical: height * 0.02,
          ),
          iconPadding: spacing(
            horizontal: 0,
            vertical: 0,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: Container(
            width: width * 0.9,
            height: height * 0.8,
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  height: height * 0.7,
                  decoration: BoxDecoration(
                    color: HexColor('#2C2C2C'),
                    borderRadius: BorderRadius.circular(
                      width * 0.03,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        color: HexColor('#2C2C2C'),
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                  width * 0.3,
                                )),
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: HexColor('#E6E6E6'),
                                  size: 32,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.text_fields,
                                  size: 24,
                                  color: HexColor('#FFFFFF'),
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                SvgPicture.asset(
                                  'assets/svg/story/sparkler.svg',
                                  width: width * 0.05,
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                SvgPicture.asset(
                                  'assets/svg/story/sticker.svg',
                                  width: width * 0.05,
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                Icon(
                                  Icons.more_horiz,
                                  size: 24,
                                  color: HexColor('#FFFFFF'),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        width: width * 0.3,
                        padding: spacing(
                          horizontal: width * 0.02,
                          vertical: 10,
                        ),
                        margin: spacing(
                          horizontal: width * 0.02,
                          vertical: 0,
                        ),
                        decoration: BoxDecoration(
                          color: HexColor('#1D1D1D'),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(width * 0.02),
                            topRight: Radius.circular(width * 0.02),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Draw',
                              style: TextStyle(
                                color: HexColor('#E6E6E6'),
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/svg/story/random-line.svg',
                              width: width * 0.05,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: width * 0.3,
                        height: height * 0.001,
                        margin: spacing(
                          horizontal: width * 0.02,
                          vertical: 0,
                        ),
                        decoration: BoxDecoration(
                          color: HexColor('#E6E6E6'),
                        ),
                      ),
                      Container(
                        width: width * 0.3,
                        padding: spacing(
                          horizontal: width * 0.02,
                          vertical: 10,
                        ),
                        margin: spacing(
                          horizontal: width * 0.02,
                          vertical: 0,
                        ),
                        decoration: BoxDecoration(
                          color: HexColor('#1D1D1D'),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(width * 0.02),
                            bottomRight: Radius.circular(width * 0.02),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Save',
                              style: TextStyle(
                                color: HexColor('#E6E6E6'),
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/svg/story/download.svg',
                              width: width * 0.07,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: width * 0.35,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            color: HexColor('#2C2C2C'),
                            borderRadius: BorderRadius.circular(width * 0.1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: width * 0.09,
                                height: width * 0.09,
                                padding: spacing(
                                  horizontal: width * 0.01,
                                  vertical: width * 0.01,
                                ),
                                decoration: BoxDecoration(
                                  color: HexColor('#000000'),
                                  border: Border.all(
                                    width: 2,
                                    color: HexColor('#4A4A4A'),
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(width * 0.1),
                                ),
                              ),
                              const Text(
                                'Your Story',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Container(
                          width: width * 0.35,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            color: HexColor('#2C2C2C'),
                            borderRadius: BorderRadius.circular(width * 0.1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: width * 0.09,
                                height: width * 0.09,
                                decoration: BoxDecoration(
                                  color: HexColor('#2C2C2C'),
                                  border: Border.all(
                                    width: 2,
                                    color: HexColor('#4A4A4A'),
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(width * 0.1),
                                ),
                                child: SvgPicture.asset(
                                  'assets/svg/story/star.svg',
                                  fit: BoxFit.cover,
                                  width: width * 0.05,
                                ),
                              ),
                              const Text(
                                'Your Story',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: spacing(
                        horizontal: width * 0.01,
                        vertical: width * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: HexColor('#2C2C2C'),
                        border: Border.all(
                          width: 2,
                          color: HexColor('#4A4A4A'),
                        ),
                        borderRadius: BorderRadius.circular(width * 0.1),
                      ),
                      child: const Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
