// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vibetag/screens/groups/group_setting/general_setting.dart';
import 'package:vibetag/screens/groups/group_setting/privacy_setting.dart';
import 'package:vibetag/screens/page/setting/page%20analytics.dart';
import 'package:vibetag/screens/page/setting/page%20general%20setting.dart';
import 'package:vibetag/screens/page/setting/page_privacy_setting.dart';
import 'package:vibetag/screens/page/setting/page_social_setting.dart';
import 'package:vibetag/screens/page/setting/page_social_setting_2.dart';

import 'package:vibetag/screens/register/reusabletext.dart';
import 'package:vibetag/utils/constant.dart';

class GroupWidget extends StatefulWidget {
  Map<String, dynamic> group;
  GroupWidget({
    Key? key,
    required this.group,
  }) : super(key: key);

  @override
  State<GroupWidget> createState() => _GroupWidgetState();
}

class _GroupWidgetState extends State<GroupWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffFFFFFF),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.group['cover'].toString().trim(),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ReusableText(
                title: widget.group['group_title'],
                size: 18,
                weight: FontWeight.w700,
                color: Color(0xff000000),
              ),
              SizedBox(
                height: 10,
              ),
              widget.group['members_count'].toString() != '0'
                  ? ReusableText(
                      title:
                          '${getInK(number: int.parse(widget.group['members_count'].toString()))} Members',
                      size: 14,
                      weight: FontWeight.w500,
                      color: Color(0xff485470),
                    )
                  : gap(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 151,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffF8F9FB),
                    ),
                    child: Column(
                      children: [
                        ReusableText(
                          title: 'Likes',
                          size: 12,
                          weight: FontWeight.w400,
                          color: Color(0xff485470),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ReusableText(
                          title:
                              '${getInK(number: int.parse(widget.group['members_count'].toString()))}',
                          size: 14,
                          weight: FontWeight.w600,
                          color: Color(0xff212121),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 60,
                    width: 151,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffF8F9FB),
                    ),
                    child: Column(
                      children: [
                        ReusableText(
                          title: 'Posts',
                          size: 12,
                          weight: FontWeight.w400,
                          color: Color(0xff485470),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ReusableText(
                          title:
                              '${getInK(number: int.parse(widget.group['members_count'].toString()))}',
                          size: 14,
                          weight: FontWeight.w600,
                          color: Color(0xff212121),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(14),
                              topLeft: Radius.circular(14))),
                      backgroundColor: const Color(0xffFFFFFF),
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (BuildContext context,
                            void Function(void Function()) setState) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height * 0.67,
                            child: ListView(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.arrow_back_outlined,
                                        color: Color(0xff212121),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Spacer(),
                                    ReusableText(
                                      title: 'Group Settings',
                                      size: 16,
                                      weight: FontWeight.w700,
                                      color: Color(0xff000000),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  thickness: 2,
                                  height: 2,
                                  color: Color(0xffE6EAF3),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(26),
                                          borderSide: const BorderSide(
                                              color: Color(0xffC8D1E5))),
                                      hintText: "Paste Link here",
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(26),
                                          borderSide: const BorderSide(
                                              color: Color(0xffC8D1E5))),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(26),
                                          borderSide: BorderSide(
                                              color: Color(0xffC8D1E5)))),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    pop(context);
                                    pushRoute(
                                      context: context,
                                      screen: GeneralSettingGroup(),
                                    );
                                  },
                                  child: ReusableText(
                                    title: 'General',
                                    size: 15,
                                    weight: FontWeight.w500,
                                    color: Color(0xff485470),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  thickness: 2,
                                  height: 2,
                                  color: Color(0xffE6EAF3),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    pop(context);
                                    pushRoute(
                                      context: context,
                                      screen: GroupPrivacySetting(),
                                    );
                                  },
                                  child: ReusableText(
                                    title: 'Privacy',
                                    size: 15,
                                    weight: FontWeight.w500,
                                    color: Color(0xff485470),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  thickness: 2,
                                  height: 2,
                                  color: Color(0xffE6EAF3),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    pop(context);
                                    pushRoute(
                                      context: context,
                                      screen: SocialSetting(),
                                    );
                                  },
                                  child: ReusableText(
                                    title: 'Social',
                                    size: 15,
                                    weight: FontWeight.w500,
                                    color: Color(0xff485470),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  thickness: 2,
                                  height: 2,
                                  color: Color(0xffE6EAF3),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    pop(context);
                                    pushRoute(
                                      context: context,
                                      screen: SocialSettingTwo(),
                                    );
                                  },
                                  child: ReusableText(
                                    title: 'Notifications',
                                    size: 15,
                                    weight: FontWeight.w500,
                                    color: Color(0xff485470),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  thickness: 2,
                                  height: 2,
                                  color: Color(0xffE6EAF3),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    pop(context);
                                    pushRoute(
                                      context: context,
                                      screen: Analytics(),
                                    );
                                  },
                                  child: ReusableText(
                                    title: 'Analytics',
                                    size: 15,
                                    weight: FontWeight.w500,
                                    color: Color(0xff485470),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  thickness: 2,
                                  height: 2,
                                  color: Color(0xffE6EAF3),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    pop(context);
                                  },
                                  child: ReusableText(
                                    title: 'Delete',
                                    size: 15,
                                    weight: FontWeight.w500,
                                    color: Color(0xff485470),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          );
                        });
                      },
                    );
                  });
                },
                child: Container(
                  height: 48,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff99A7C7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        color: Color(0xffFFFFFF),
                      ),
                      ReusableText(
                        title: '  Edit',
                        size: 15,
                        weight: FontWeight.w700,
                        color: Color(0xffFFFFFF),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            right: 0,
            top: 90,
            left: 0,
            child: Center(
              child: Container(
                width: 90,
                height: 90,
                child: ClipRRect(
                  borderRadius: borderRadius(75),
                  child: Image(
                    image: NetworkImage(
                      widget.group['avatar'].toString().trim(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
