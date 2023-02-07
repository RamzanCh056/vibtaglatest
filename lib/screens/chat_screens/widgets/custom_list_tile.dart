import 'package:flutter/material.dart';

import '../constants.dart';
import '../screen/pages/page_message.dart';
import '../screen/private_message_screen.dart';

class CustomListTile extends StatefulWidget {
  Map<String, dynamic> mapData;
  CustomListTile({required this.mapData});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: lightGrey,
      ),
      child: ListTile(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => PageMessage()));
          },
          minVerticalPadding: 0,
          leading: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                widget.mapData['imgurl'],
                fit: BoxFit.cover,
              ),
              if (widget.mapData['isOnline'])
                Positioned(
                  top: -1,
                  right: 3,
                  child: Container(
                    width: screenWidthSize(11, context),
                    height: screenHeightSize(11, context),
                    decoration: BoxDecoration(
                        color: cyanGreenColor,
                        border: Border.all(width: 1, color: Colors.white),
                        shape: BoxShape.circle),
                  ),
                ),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.mapData['subtitle'],
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: txtColor,
                ),
              ),
              if (widget.mapData['msgNotifications'] != 0)
                Container(
                    alignment: Alignment.center,
                    width: screenWidthSize(15, context),
                    height: screenHeightSize(15, context),
                    decoration: BoxDecoration(
                      color: orangeColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      widget.mapData['msgNotifications'].toString(),
                      style: TextStyle(
                          fontSize: screenWidthSize(10, context),
                          color: Colors.white),
                    )),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.mapData['title'],
                style: TextStyle(
                  fontSize: screenWidthSize(17, context),
                  fontWeight: FontWeight.w500,
                  color: fontColor,
                ),
              ),
              Text(
                widget.mapData['time'],
                style: TextStyle(
                  fontSize: screenWidthSize(13, context),
                  fontWeight: FontWeight.w600,
                  color: txtColor,
                ),
              ),
            ],
          )),
    );
  }
}
