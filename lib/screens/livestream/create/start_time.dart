import 'package:flutter/material.dart';
import 'package:vibetag/utils/constant.dart';

class StartTime extends StatefulWidget {
  const StartTime({super.key});

  @override
  State<StartTime> createState() => _StartTimeState();
}

class _StartTimeState extends State<StartTime> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.45,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: spacing(
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/new/icons/livestream/icons_left.png'),
                Container(
                  padding: spacing(
                    vertical: 20,
                  ),
                  child: Text(
                    'Start Time',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                gap(),
              ],
            ),
          ),
          Container(
            height: 2,
            width: double.maxFinite,
            color: grayMed,
          ),
          gap(h: 15),
          InkWell(
            onTap: () {},
            child: Container(
              padding: spacing(
                horizontal: 10,
                vertical: 15,
              ),
              margin: spacing(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: grayLight,
                borderRadius: borderRadius(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      gap(w: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Date',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: grayMed,
                            ),
                          ),
                          gap(h: 5),
                          Text(
                            '19 Feb, 2023',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: blackPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 20,
                    child: Image.asset(
                      'assets/new/icons/Calendar-2.png',
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: spacing(
                horizontal: 10,
                vertical: 15,
              ),
              margin: spacing(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: grayLight,
                borderRadius: borderRadius(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      gap(w: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: grayMed,
                            ),
                          ),
                          gap(h: 5),
                          Text(
                            '06:45 PM',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: blackPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 30,
                    child: Image.asset(
                      'assets/new/icons/livestream/time.png',
                    ),
                  )
                ],
              ),
            ),
          ),
          gap(h: 30),
          Container(
            margin: spacing(horizontal: 25),
            child: Container(
              width: double.maxFinite,
              padding: spacing(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: borderRadius(10),
                border: Border.all(
                  width: 2,
                  color: orange,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'Done',
                style: TextStyle(
                  color: orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
