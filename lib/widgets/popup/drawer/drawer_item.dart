import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/constant.dart';

class DrawerItems extends StatelessWidget {
  final String title;
  final String imgUrl;
  final int? notifications;
  final bool isNewNotification;
  DrawerItems({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.notifications,
    required this.isNewNotification,
  });

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      width: double.maxFinite,
      padding: spacing(
        horizontal: width * 0.02,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: HexColor('#F0F0F0'),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            '${imgUrl}',
            width: width * 0.07,
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 5,
            ),
            alignment: Alignment.center,
            child: Text("${title}"),
          ),
          SizedBox(
            width: width * 0.02,
          ),
          isNewNotification
              ? Container(
                  width: width * 0.07,
                  height: width * 0.07,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: HexColor('#F90202'),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    '${notifications}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
