import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

createBottomModalSheet(
    {required BuildContext context, required Widget screen}) {
  return showBarModalBottomSheet(
      barrierColor: Color.fromARGB(0, 255, 255, 255),
      elevation: 0,
      topControl: Container(),
      backgroundColor: Color.fromARGB(0, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      context: context,
      builder: (context) {
        return screen;
      });
}
