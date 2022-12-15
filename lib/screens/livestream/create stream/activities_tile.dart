import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/constant.dart';

class ActivitiesTile extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String background;
  final String titleColor;

  ActivitiesTile({
    super.key,
    required this.title,
    required this.titleColor,
    required this.imgUrl,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: HexColor('${background}'),
        borderRadius: BorderRadius.circular(
          width * 0.02,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width * 0.1,
            height: width * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                width * 0.1,
              ),
            ),
            padding: spacing(
              horizontal: width * 0.015,
              vertical: height * 0.01,
            ),
            margin: spacing(
              horizontal: width * 0.015,
              vertical: height * 0.01,
            ),
            child: Image.asset(
              '${imgUrl}',
            ),
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Container(
            height: height * 0.1,
            width: width * 0.2,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: HexColor(
                  '$titleColor',
                ),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.clip,
              ),
            ),
          )
        ],
      ),
    );
  }
}
