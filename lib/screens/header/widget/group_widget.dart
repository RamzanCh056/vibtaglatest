// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vibetag/screens/groups/group.dart';
import 'package:vibetag/screens/header/const.dart';

import '../../../utils/constant.dart';

class GroupSearchWidget extends StatefulWidget {
  final Map<String, dynamic> group;
  const GroupSearchWidget({
    Key? key,
    required this.group,
  }) : super(key: key);

  @override
  State<GroupSearchWidget> createState() => _GroupSearchWidgetState();
}

class _GroupSearchWidgetState extends State<GroupSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showSearchOption = !showSearchOption;
        setState(() {});
        pushRoute(
          context: context,
          screen:GroupScreen(group_id: widget.group['id'].toString(),),
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
                  widget.group['avatar'].toString(),
                ),
              ),
            ),
            gap(w: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.group['group_title'] != null
                    ? Text(setName(widget.group['group_title'].toString()))
                    : gap(),
                gap(h: 2),
                widget.group['group_name'] != null
                    ? Text(
                        setName(widget.group['group_name'].toString()),
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
