import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constant.dart';

BottomModalItems({
  required String iconPath,
  required String title,
  required int notifications,
  Color? bgColor,
  onTap,
}) {
  return StatefulBuilder(builder: ((context, setState) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        padding: spacing(
          horizontal: 10,
          vertical: 10,
        ),
        margin: spacing(
          horizontal: 15,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          color: bgColor != null ? bgColor : grayLight,
          borderRadius: borderRadius(9),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width * 0.09,
              height: width * 0.09,
              child: Stack(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      iconPath,
                      fit: BoxFit.cover,
                      color: grayMed,
                    ),
                  ),
                  notifications != 0
                      ? Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 18,
                            height: 18,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: orangePrimary,
                                borderRadius: borderRadius(width),
                                border: Border.all(
                                  width: 2,
                                  color: white,
                                )),
                            child: Center(
                              child: Text(
                                '${notifications}',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 8,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            gap(
              w: 10,
            ),
            Container(
              width: width * 0.7,
              child: Text(
                '${title}',
                style: TextStyle(
                  color: bgColor != null ? white : blackPrimary,
                  overflow: TextOverflow.clip,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }));
}
