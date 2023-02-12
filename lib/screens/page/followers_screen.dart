import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/constant.dart';

class Followers extends StatefulWidget {
  const Followers({super.key});

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                gap(h: height * 0.01),
                Container(
                  padding: spacing(
                    horizontal: 15,
                    vertical: height * 0.015,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back,
                      ),
                      Text('Followers'),
                      gap()
                    ],
                  ),
                ),
                Container(
                  margin: spacing(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  width: double.maxFinite,
                  height: 1,
                  color: grayMed,
                ),
                gap(h: 10),
                Container(
                  height: height * 0.06,
                  margin: spacing(
                    horizontal: 15,
                  ),
                  width: double.maxFinite,
                  child: TextFormField(
                    style: TextStyle(
                      color: grayMed,
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                      prefix: Padding(
                        padding: spacing(
                          horizontal: 15,
                        ),
                        child: Icon(
                          Icons.search,
                          color: grayPrimary,
                          size: 18,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: grayMed,
                        ),
                        borderRadius: borderRadius(width),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: grayMed,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                gap(h: height * 0.01),
                Container(
                  height: height * 0.83,
                  margin: spacing(
                    horizontal: 15,
                  ),
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, i) {
                      return Container(
                        padding: spacing(
                          vertical: 10,
                        ),
                        margin: spacing(
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: grayMed,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: width * 0.07,
                                  backgroundColor: grayLight,
                                  foregroundImage:
                                      AssetImage('assets/new/images/user.png'),
                                ),
                                gap(w: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mark Henry',
                                      style: TextStyle(
                                        color: blackPrimary,
                                        fontSize: 12,
                                      ),
                                    ),
                                    gap(h: 5),
                                    Text(
                                      '@mark_h01',
                                      style: TextStyle(
                                        color: grayMed,
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            i % 4 == 0
                                ? Container(
                                    padding: spacing(
                                      horizontal: 35,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius(5),
                                      color: grayLight,
                                    ),
                                    child: Text(
                                      'Following',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: i % 4 == 0 ? grayMed : orange,
                                      ),
                                    ),
                                  )
                                : Container(
                                    padding: spacing(
                                      horizontal: 25,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius(5),
                                      border: Border.all(
                                        width: 1,
                                        color: orange,
                                      ),
                                    ),
                                    child: Text(
                                      'Follow Back',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: orange,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
