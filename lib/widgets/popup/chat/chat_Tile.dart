import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/chat_inbox.dart';

import '../../../utils/constant.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String time;
  final String profilePic;
  final String seenPic;
  final bool isActive;
  final bool isSeen;
  ChatTile({
    super.key,
    required this.name,
    required this.time,
    required this.profilePic,
    required this.seenPic,
    required this.isActive,
    required this.isSeen,
  });

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        pushRoute(context: context, screen: ChatScreen());
      },
      child: Container(
        width: width * 0.95,
        height: height * 0.1,
        decoration: BoxDecoration(
          color: HexColor('#FFFFFF'),
          borderRadius: BorderRadius.circular(
            width * 0.03,
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            foregroundImage: AssetImage('${profilePic}'),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${name}',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              isActive
                  ? Container(
                      width: width * 0.03,
                      height: width * 0.03,
                      decoration: BoxDecoration(
                        color: HexColor('#0DC700'),
                        borderRadius: BorderRadius.circular(
                          width * 0.04,
                        ),
                      ),
                    )
                  : Container(
                      width: 0,
                      height: 0,
                    ),
            ],
          ),
          subtitle: Text(
            '${time}',
            style: TextStyle(
              color: HexColor('#D1D1D1'),
            ),
          ),
          trailing: isSeen
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      width: width * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          width * 0.04,
                        ),
                      ),
                      child: CircleAvatar(
                        foregroundImage: AssetImage(
                          '${seenPic}',
                        ),
                      ),
                    ),
                  ],
                )
              : Container(
                  width: 0,
                  height: 0,
                ),
        ),
      ),
    );
  }
}
