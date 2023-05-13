// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vibetag/screens/profile/profile.dart';

import '../../../utils/constant.dart';
import '../const.dart';

class UserSearchWidget extends StatefulWidget {
  final Map<String, dynamic> user;
  const UserSearchWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UserSearchWidget> createState() => _UserSearchWidgetState();
}

class _UserSearchWidgetState extends State<UserSearchWidget> {
  @override
  Widget build(BuildContext context) {
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    return InkWell(
      onTap: () {
        showSearchOption = !showSearchOption;
        setState(() {});
        pushRoute(
          context: context,
          screen: Profile(
            user_id: widget.user['user_id'].toString(),
          ),
        );
      },
      child: Container(
        width: width,
        margin: spacing(vertical: 5),
        padding: spacing(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: grayLight,
          boxShadow: lightShadow,
          borderRadius: borderRadius(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              child: ClipRRect(
                borderRadius: borderRadius(50),
                child: netImage(
                  widget.user['avatar'].toString(),
                ),
              ),
            ),
            gap(w: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.user['name'] != null
                    ? Text(setName(widget.user['name'].toString()))
                    : gap(),
                gap(h: 2),
                widget.user['username'] != null
                    ? Text(
                        setName(widget.user['username'].toString()),
                        style: TextStyle(
                          color: grayMed,
                          fontSize: 12,
                        ),
                      )
                    : gap(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
