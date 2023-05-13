import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constant.dart';

class AddUserToStream extends StatefulWidget {
  const AddUserToStream({super.key});

  @override
  State<AddUserToStream> createState() => _AddUserToStreamState();
}

class _AddUserToStreamState extends State<AddUserToStream> {
  @override
  Widget build(BuildContext context) {
    height = deviceHeight(context: context);
    return Container(
      height: height * 0.7,
      decoration: BoxDecoration(
        color: white,
        boxShadow: lightShadow,
        borderRadius: borderRadius(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: spacing(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
              color: white,
              borderRadius: radiusOnly(
                topLeft: 7,
                topRight: 7,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    pop(context);
                  },
                  child: Container(
                    width: 25,
                    child: SvgPicture.asset(
                      'assets/new/icons/livestream/video_call_arrow_back_left.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Invite Friends',
                  style: TextStyle(
                    fontSize: 18,
                    color: grayPrimary,
                  ),
                ),
                gap(),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: grayMed,
          ),
          gap(h: 30),
          Container(
            height: height * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: spacing(horizontal: 10),
                      child: Text('Share with'),
                    ),
                    gap(h: 10),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: spacing(horizontal: 10),
                          padding: spaceOnly(left: 45),
                          decoration: BoxDecoration(
                            color: grayLight,
                            borderRadius: borderRadius(7),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Search friends',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 25,
                            child: SvgPicture.asset(
                              'assets/new/icons/livestream/video_call_search_button.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                    gap(h: 30),
                    Container(
                      height: height * 0.17,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: spacing(horizontal: 7),
                            child: Column(children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: height * 0.06,
                                    foregroundImage: AssetImage(
                                        'assets/new/images/user.png'),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 0,
                                    child: Container(
                                      width: 20,
                                      child: SvgPicture.asset(
                                        'assets/new/icons/livestream/video_call_close.svg',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              gap(h:10),
                              Text(
                                'Mark J.',
                                style: TextStyle(
                                  color: grayPrimary,
                                ),
                              )
                            ]),
                          );
                        },
                      ),
                    )
                  ],
                ),
                Container(
                  margin: spacing(horizontal: 7),
                  padding: spacing(vertical: 15),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius(7),
                    border: Border.all(
                      color: orange,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 18,
                      color: orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
