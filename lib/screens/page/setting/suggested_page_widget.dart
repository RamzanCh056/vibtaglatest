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

class SuggestedPageWidget extends StatefulWidget {
  Map<String, dynamic> page;
  SuggestedPageWidget({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  State<SuggestedPageWidget> createState() => _SuggestedPageWidgetState();
}

class _SuggestedPageWidgetState extends State<SuggestedPageWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius(10),
      child: Container(
        height: 400,
        margin: spacing(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffFFFFFF),
          boxShadow: boxShadow,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  child: ClipRRect(
                    borderRadius: radiusOnly(
                      topLeft: 10,
                      topRight: 10,
                    ),
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        widget.page['cover'].toString().trim(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                ReusableText(
                  title: setName(
                    widget.page['page_title'],
                    length: 30,
                  ),
                  size: 18,
                  weight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
                SizedBox(
                  height: 10,
                ),
                widget.page['likes'].toString() != '0'
                    ? ReusableText(
                        title:
                            '${getInK(number: int.parse(widget.page['likes'].toString()))} Members',
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
                                '${getInK(number: int.parse(widget.page['likes'].toString()))}',
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
                                '${getInK(number: int.parse(widget.page['likes'].toString()))}',
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
                Container(
                  width: width,
                  padding: spacing(horizontal: 7, vertical: 10),
                  margin: spacing(horizontal: 15),
                  decoration: BoxDecoration(
                    boxShadow: boxShadow,
                    gradient: gradient,
                    borderRadius: borderRadius(5),
                  ),
                  child: Text(
                    'Like',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
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
                        widget.page['avatar'].toString().trim(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
