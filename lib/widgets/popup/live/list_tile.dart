import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/constant.dart';

class LiveListTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subtitle;

  const LiveListTile({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      width: width * 0.8,
      height: height * 0.1,
      decoration: BoxDecoration(
        color: HexColor('#EDEDED'),
        borderRadius: BorderRadius.circular(
          width * 0.02,
        ),
      ),
      child: ListTile(
        leading: Container(
          width: width * 0.15,
          height: width * 0.15,
          padding: spacing(
            horizontal: width * 0.02,
            vertical: width * 0.02,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              width * 0.2,
            ),
          ),
          child: Image.asset(
            imgUrl,
            width: width * 0.08,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right_outlined,
        ),
      ),
    );
  }
}
