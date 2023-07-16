import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/widgets/media_library.dart';
import 'package:vibetag/screens/chat/chat_Tile.dart';
import 'package:vibetag/widgets/select_field.dart';

import '../../utils/constant.dart';

ChatProfile({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  TextEditingController mediaController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: HexColor('#F0F0F0'),
          insetPadding: EdgeInsets.only(
            top: height * 0.05,
          ),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          iconPadding: EdgeInsets.only(
            top: height * 0.01,
            right: height * 0.01,
            left: width * 0.95,
          ),
          content: Container(
            width: width,
            height: height * 0.6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: width,
                          height: height * 0.6,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 30,
                        right: 30,
                        child: Container(
                          height: height * 0.435,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                            color: HexColor('#FAFAFA'),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        height: height * 0.2,
                        alignment: Alignment.center,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(
                              width * 0.2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: width * 0.15,
                            foregroundImage: AssetImage(
                              'assets/images/streamer.jpg',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.02,
                        right: width * 0.16,
                        child: Container(
                          width: width * 0.1,
                          height: width * 0.1,
                          child: Image.asset('assets/images/flag.png'),
                        ),
                      ),
                      Positioned(
                        top: height * 0.2,
                        right: 0,
                        left: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Ilizbat Baby',
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.23,
                        right: 0,
                        left: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            '@Ilizbat_baby1',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.26,
                        right: 0,
                        left: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Active 2h ago',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.3,
                        right: width * 0.1,
                        left: width * 0.1,
                        child: Container(
                          alignment: Alignment.center,
                          color: HexColor('#C0C0C0'),
                          width: width * 0.6,
                          height: 2,
                        ),
                      ),
                      Positioned(
                        bottom: height * 0.18,
                        right: width * 0.1,
                        left: width * 0.1,
                        child: Container(
                          padding: spacing(
                            horizontal: 7,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: HexColor('#E9E9E9'),
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/chat/call1.svg',
                                width: width * 0.05,
                              ),
                              SvgPicture.asset(
                                'assets/svg/chat/facetime-button.svg',
                                width: width * 0.05,
                              ),
                              Container(
                                width: width * 0.07,
                                child: Image.asset(
                                  'assets/images/group call.png',
                                  width: width * 0.07,
                                ),
                              ),
                              Icon(
                                Icons.more_vert_outlined,
                                color: Colors.orange,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: height * 0.03,
                        right: width * 0.1,
                        left: width * 0.1,
                        child: Container(
                          padding: spacing(
                            horizontal: 7,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: HexColor('#E9E9E9'),
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          child: MediaLibrary(
                            controller: mediaController,
                            items: const [
                              'Media/Attachments',
                              'Videos',
                              'Select',
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
