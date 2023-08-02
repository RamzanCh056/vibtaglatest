import 'package:flutter/material.dart';
import 'package:vibetag/screens/page/setting/overall.dart';

import '../../register/reusabletext.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Color(0xff000000),
                  ),
                ),
                Spacer(),
                ReusableText(
                  title: 'Analytics',
                  size: 16,
                  weight: FontWeight.w700,
                  color: Color(0xff363D4C),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  child: Container(
                    height: 38,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: _currentIndex == 0
                            ? Color(0xff485470)
                            : Color(0xffF1F4FB)),
                    child: Center(
                      child: ReusableText(
                        title: 'Overall',
                        size: 14,
                        weight: FontWeight.w600,
                        color: _currentIndex == 0
                            ? Color(0xffFFFFFF)
                            : Color(0xff485470),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                  child: Container(
                    height: 38,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: _currentIndex == 1
                            ? Color(0xff485470)
                            : Color(0xffF1F4FB)),
                    child: Center(
                      child: ReusableText(
                        title: 'Today',
                        size: 14,
                        weight: FontWeight.w600,
                        color: _currentIndex == 1
                            ? Color(0xffFFFFFF)
                            : Color(0xff485470),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  child: Container(
                    height: 38,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: _currentIndex == 2
                            ? Color(0xff485470)
                            : Color(0xffF1F4FB)),
                    child: Center(
                      child: ReusableText(
                        title: 'Last 30 days',
                        size: 14,
                        weight: FontWeight.w600,
                        color: _currentIndex == 2
                            ? Color(0xffFFFFFF)
                            : Color(0xff485470),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                  },
                  child: Container(
                    height: 38,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: _currentIndex == 3
                            ? Color(0xff485470)
                            : Color(0xffF1F4FB)),
                    child: Center(
                      child: ReusableText(
                        title: 'Last 3 months',
                        size: 14,
                        weight: FontWeight.w600,
                        color: _currentIndex == 3
                            ? Color(0xffFFFFFF)
                            : Color(0xff485470),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            _currentIndex == 0 ? OverAllScreen() : Container()
          ],
        ),
      ),
    ));
  }
}
