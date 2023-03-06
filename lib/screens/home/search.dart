import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/chat/chat_Tile.dart';
import 'package:vibetag/screens/chat/chat_details.dart';
import 'package:vibetag/screens/home/search_popup.dart';

import '../../utils/constant.dart';

SearchPopup({required BuildContext context, required String keyword}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showDialog(
    context: context,
    builder: (context) {
      return SearchBarPop(
        keyword: keyword,
      );
    },
  );
}

ShowDailogBox({required BuildContext context, required Widget screen}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showDialog(
    context: context,
    builder: (context) {
      return screen;
    },
  );
}
