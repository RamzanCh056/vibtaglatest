import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/widgets/live.dart';
import '../../../utils/constant.dart';

LiveInvite({required BuildContext context}) {
  int groupValue = -1;
  int? _value = 1;

  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          iconPadding: EdgeInsets.only(
            top: height * 0.01,
            right: height * 0.01,
            left: width * 0.95,
          ),
          icon: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
                padding: EdgeInsets.all(
                  width * 0.01,
                ),
                decoration: BoxDecoration(
                    color: HexColor('#DDDDDD'),
                    borderRadius: BorderRadius.circular(
                      width * 0.3,
                    )),
                child: Icon(Icons.close)),
          ),
          content: Container(
            width: width * 0.95,
            height: height * 0.8,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: spacing(
                    horizontal: width * 0.07,
                    vertical: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          LivePopUp(context: context);
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_left,
                          size: 48,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.07,
                      ),
                      const Text(
                        'Who is invited?',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  width: width * 0.85,
                  decoration: BoxDecoration(
                    color: HexColor('#ececec'),
                    borderRadius: BorderRadius.circular(
                      width * 0.02,
                    ),
                  ),
                  child: ListTile(
                    leading: Container(
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
                        'assets/images/live/team.png',
                      ),
                    ),
                    title: const Text('Everyone'),
                    subtitle: const Text(
                      'Anyone can see and join this room on Vibetag.',
                    ),
                    trailing: Radio(
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.orange.withOpacity(.32);
                          }
                          return Colors.orange;
                        },
                      ),
                      activeColor: Colors.red,
                      groupValue: _value,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  width: width * 0.85,
                  decoration: BoxDecoration(
                    color: HexColor('#ececec'),
                    borderRadius: BorderRadius.circular(
                      width * 0.02,
                    ),
                  ),
                  child: ListTile(
                    leading: Container(
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
                        'assets/images/live/people.png',
                      ),
                    ),
                    title: const Text('Your Friends'),
                    subtitle: const Text(
                      'All your friends can see and join this room on Vibetag.',
                    ),
                    trailing: Radio(
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.orange.withOpacity(.32);
                          }
                          return Colors.orange;
                        },
                      ),
                      activeColor: Colors.red,
                      groupValue: _value,
                      value: 2,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  width: width * 0.85,
                  decoration: BoxDecoration(
                    color: HexColor('#ececec'),
                    borderRadius: BorderRadius.circular(
                      width * 0.02,
                    ),
                  ),
                  child: ListTile(
                    leading: Container(
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
                        'assets/images/live/Invite friends.png',
                      ),
                    ),
                    title: const Text('Custom Friends'),
                    subtitle: const Text(
                      'Choose specific friends who can see and join this room.',
                    ),
                    trailing: Radio(
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.orange.withOpacity(.32);
                          }
                          return Colors.orange;
                        },
                      ),
                      activeColor: Colors.red,
                      groupValue: _value,
                      value: 3,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
