import 'package:flutter/material.dart';
import 'package:vibetag/screens/page/setting/page_social_setting.dart';
import 'package:vibetag/utils/constant.dart';
import '../../register/reusabletext.dart';

class GroupPrivacySetting extends StatefulWidget {
  const GroupPrivacySetting({Key? key}) : super(key: key);

  @override
  State<GroupPrivacySetting> createState() => _GroupPrivacySettingState();
}

class _GroupPrivacySettingState extends State<GroupPrivacySetting> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: Color(0xff000000),
                  ),
                ),
                Spacer(),
                ReusableText(
                  title: 'Privacy Settings',
                  size: 16,
                  weight: FontWeight.w700,
                  color: Color(0xff363D4C),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SocialSetting()));
                    });
                  },
                  child: Container(
                    width: 56,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xffFDBA31),
                          Color(0xffFF9200),
                        ]),
                        borderRadius: BorderRadius.circular(26)),
                    child: Center(
                      child: ReusableText(
                        title: 'Save',
                        size: 14,
                        weight: FontWeight.w700,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 52,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffC8D1E5),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFFFFFF)),
              child: Row(
                children: [
                  ReusableText(
                    title: 'Allow Review on group',
                    size: 16,
                    weight: FontWeight.w600,
                    color: Color(0xff212121),
                  ),
                  Spacer(),
                  Switch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                    activeColor: Color(0xffFFFFFF), // Active color
                    activeTrackColor: Color(0xFFFFC007), // Head color
                    inactiveThumbColor: Color(0xFFFFFFFF), // Unactive color
                    inactiveTrackColor: Color(0xFF000000), // Border color
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffC8D1E5),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFFFFFF)),
              child: ListTile(
                title: ReusableText(
                  title: 'Who can post on group?',
                  size: 16,
                  weight: FontWeight.w700,
                  color: Color(0xff212121),
                ),
                subtitle: ReusableText(
                  title: 'Everyone',
                  size: 16,
                  weight: FontWeight.w600,
                  color: Color(0xff7D8CAC),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xff99A7C7),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffC8D1E5),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFFFFFF)),
              child: ListTile(
                title: ReusableText(
                  title: 'Who can see post on group?',
                  size: 16,
                  weight: FontWeight.w700,
                  color: Color(0xff212121),
                ),
                subtitle: ReusableText(
                  title: 'Everyone',
                  size: 16,
                  weight: FontWeight.w600,
                  color: Color(0xff7D8CAC),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xff99A7C7),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffC8D1E5),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFFFFFF)),
              child: ListTile(
                title: ReusableText(
                  title: 'Allow message in your group',
                  size: 16,
                  weight: FontWeight.w700,
                  color: Color(0xff212121),
                ),
                subtitle: ReusableText(
                  title: 'Everyone',
                  size: 16,
                  weight: FontWeight.w600,
                  color: Color(0xff7D8CAC),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xff99A7C7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
