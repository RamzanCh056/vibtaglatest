import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/chat/chat_Tile.dart';
import 'package:vibetag/screens/chat/chat_details.dart';

import '../../utils/constant.dart';

BottomDrawer({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showBarModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        child: Column(
          children: [],
        ),
      );
    },
  );
}
