import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constant.dart';

Widget HomeTabBar() {
  return StatefulBuilder(
    builder: (BuildContext context, setState) {
      double width = deviceWidth(context: context);
      double height = deviceHeight(context: context);
      return Center(
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              width * 0.02,
            ),
          ),
          child: DefaultTabController(
            length: 7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TabBar(
                  unselectedLabelColor: Color.fromARGB(255, 110, 107, 107),
                  labelColor: Colors.orange,
                  indicatorColor: Colors.orange,
                  labelStyle: TextStyle(
                    fontSize: 24,
                  ),
                  tabs: [
                    Tab(
                      icon: Container(
                        width: width * 0.04,
                        child: SvgPicture.asset(
                          'assets/new/svg/category.svg',
                          color: grayMed,
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/camera.svg',
                          color: grayMed,
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/live_stream.svg',
                          color: grayMed,
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/location.svg',
                          color: grayMed,
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/speaker.svg',
                          color: grayMed,
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/doc.svg',
                          color: grayMed,
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        width: width * 0.045,
                        child: SvgPicture.asset(
                          'assets/new/svg/live.svg',
                          color: grayMed,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ),
      );
    },
  );
}
