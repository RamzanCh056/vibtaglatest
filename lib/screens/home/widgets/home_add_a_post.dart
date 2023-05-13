import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';

import '../../../utils/constant.dart';
import '../../../widgets/post_option.dart';
final List<Widget> postOptions = [
    postOption(
      title: 'Upload Image',
      icon: 'assets/svg/post/image.svg',
      iconColor: HexColor('#5A92ED'),
    ),
    postOption(
      title: 'Upload Video',
      icon: 'assets/svg/post/video-camera.svg',
      iconColor: HexColor('#1EC722'),
    ),
    postOption(
      title: 'GIF',
      icon: 'assets/svg/post/plate.svg',
      iconColor: HexColor('#E5758F'),
    ),
    postOption(
      title: 'Upload Recording',
      icon: 'assets/svg/post/microphone.svg',
      iconColor: HexColor('#32C0D9'),
    ),
    postOption(
      title: 'Feelings',
      icon: 'assets/svg/post/smile.svg',
      iconColor: HexColor('#F5BC2B'),
    ),
    postOption(
      title: 'Upload Files',
      icon: 'assets/svg/post/folder.svg',
      iconColor: HexColor('#8D70DB'),
    ),
    postOption(
      title: 'Sell Products',
      icon: 'assets/svg/post/shopping-cart.svg',
      iconColor: HexColor('#FF9200'),
    ),
    postOption(
      title: 'Create Poll',
      icon: 'assets/svg/post/poll.svg',
      iconColor: HexColor('#868686'),
    ),
    postOption(
      title: 'Location',
      icon: 'assets/svg/post/maps-and-flags.svg',
      iconColor: HexColor('#77300A'),
    ),
    postOption(
      title: 'Audio Upload',
      icon: 'assets/svg/post/headphone.svg',
      iconColor: HexColor('#000000'),
    ),
  ];

Future<dynamic> Add_A_Post(
    {required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: ((context, setState) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            backgroundColor: Colors.white,
            iconPadding: EdgeInsets.only(
              top: height * 0.01,
              right: height * 0.01,
              left: width * 0.95,
            ),
            icon: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                  padding: EdgeInsets.all(
                    width * 0.01,
                  ),
                  decoration: BoxDecoration(
                      color: HexColor('#DDDDDD'),
                      borderRadius: BorderRadius.circular(
                        width * 0.3,
                      )),
                  child: Icon(Icons.close)),
            ),
            content: Container(
              width: width * 0.95,
              height: height * 0.85,
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: spacing(
                      horizontal: width * 0.05,
                      vertical: 0,
                    ),
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'What\'s happening',
                            style: TextStyle(
                              color: HexColor('#7C7C7C'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.15,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: spacing(
                                      horizontal: width * 0.015,
                                      vertical: 0,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/svg/post/color-circle.svg',
                                      fit: BoxFit.cover,
                                      width: width * 0.06,
                                    ),
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: width * 0.015,
                                      vertical: 5,
                                    ),
                                    margin: spacing(
                                      horizontal: width * 0.015,
                                      vertical: 7,
                                    ),
                                    decoration: BoxDecoration(
                                      color: HexColor('#F0F0F0'),
                                      borderRadius:
                                          BorderRadius.circular(width * 0.02),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width * 0.04,
                                          child: const SvgIcon(
                                            'assets/svg/post/world.svg',
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.015,
                                        ),
                                        const Text(
                                          'Everyone',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: spacing(
                                            horizontal: width * 0.015,
                                            vertical: 9,
                                          ),
                                          decoration: BoxDecoration(
                                            color: HexColor('#F0F0F0'),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                width * 0.02,
                                              ),
                                              topLeft: Radius.circular(
                                                width * 0.02,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: const [
                                              Text(
                                                'Category',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: HexColor('#F0F0F0'),
                                            borderRadius: BorderRadius.circular(
                                              width * 0.02,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 1,
                                                          color: Colors.black38,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                            width * 0.02,
                                                          ),
                                                        ),
                                                      ),
                                                      child: const Icon(
                                                        Icons
                                                            .keyboard_arrow_up_rounded,
                                                        size: 14,
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 1,
                                                          color: Colors.black38,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                            width * 0.02,
                                                          ),
                                                        ),
                                                      ),
                                                      child: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        size: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/post/hashtag.svg',
                                    fit: BoxFit.cover,
                                    width: width * 0.05,
                                  ),
                                  SizedBox(
                                    width: width * 0.025,
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/post/at-sign.svg',
                                    fit: BoxFit.cover,
                                    width: width * 0.05,
                                  ),
                                  SizedBox(
                                    width: width * 0.025,
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/post/smile1.svg',
                                    fit: BoxFit.cover,
                                    width: width * 0.05,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * 0.001,
                    color: Colors.black38,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    height: height * 0.45,
                    padding: spacing(
                      horizontal: width * 0.03,
                      vertical: 0,
                    ),
                    child: GridView.builder(
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 6 / 2,
                      ),
                      itemBuilder: (context, i) {
                        return postOptions[i];
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    padding: spacing(
                      horizontal: width * 0.05,
                      vertical: height * 0.02,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(
                        width * 0.02,
                      ),
                    ),
                    child: const Text(
                      'Publish',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      );
    },
  );
}
