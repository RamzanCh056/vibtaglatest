import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../utils/constant.dart';

Widget AboutItems({
  required BuildContext context,
  required String iconsUrl,
  required String leading,
  required String itemName,
  bool haveIcon = false,
  bool showButton = false,
  String buttonText = '',
}) {
  double width = deviceWidth(context: context);
  return Container(
    padding: spacing(
      horizontal: 10,
      vertical: 10,
    ),
    margin: spacing(
      vertical: 5,
    ),
    decoration: BoxDecoration(
      color: white,
      borderRadius: borderRadius(5),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        haveIcon
            ? Container(
                width: 25,
                height: 25,
                child: Image.asset(iconsUrl),
              )
            : gap(),
        gap(w: 10),
        Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${leading} ',
                  style: TextStyle(
                    color: blackPrimary,
                    fontSize: 14,
                  ),
                ),
                Container(
                  width: width * 0.5,
                  child: Html(
                    data: '${itemName}',
                    style: {
                      "body": Style(
                        fontSize: FontSize(14.0),
                        color: blackPrimary,
                        fontWeight: FontWeight.bold,
                        textOverflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    },
                  ),
                ),
              ],
            ),
            showButton
                ? Container(
                    padding: spacing(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: borderRadius(width),
                      color: orange,
                    ),
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        color: white,
                      ),
                    ),
                  )
                : gap(),
          ],
        ),
      ],
    ),
  );
}
