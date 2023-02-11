import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibetag/model/user.dart';
import 'package:vibetag/screens/home/home_add_a_post.dart';

import '../../utils/constant.dart';

Widget HomeSearchBar({
  required ModelUser user,
}) {
  return StatefulBuilder(builder: (context, setState) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      margin: spacing(
        vertical: 10,
      ),
      padding: spacing(
        vertical: 10,
        horizontal: 10,
      ),
      width: double.maxFinite,
      color: white,
      height: height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: width * 0.12,
            height: width * 0.12,
            padding: EdgeInsets.all(
              width * 0.01,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/new/images/border.png',
                ),
              ),
            ),
            child: CircleAvatar(
              radius: width * 0.055,
              foregroundImage: NetworkImage(
                user.avatar.toString(),
              ),
            ),
          ),
          Container(
            width: width * 0.65,
            decoration: BoxDecoration(
              color: grayLight,
              borderRadius: borderRadius(width),
            ),
            child: TextFormField(
              onTap: () {
                Add_A_Post(
                  context: context,
                );
              },
              decoration: InputDecoration(
                  hintText: 'What\'s your vibe',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(
                    left: 15,
                    bottom: 10,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: grayMed,
                  )),
            ),
          ),
          Container(
            height: width * 0.11,
            width: width * 0.11,
            child: SvgPicture.asset(
              'assets/svg/chat/plus.svg',
            ),
          )
        ],
      ),
    );
  });
}
