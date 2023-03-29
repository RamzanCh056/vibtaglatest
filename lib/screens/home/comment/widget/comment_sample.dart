import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/chat/chat_Tile.dart';
import 'package:vibetag/screens/chat/chat_details.dart';

import '../../../../utils/constant.dart';

Comments({required BuildContext context}) {
  return showBarModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        child: Column(
          children: [
            Container(
              padding: spacing(
                horizontal: 15,
                vertical: 20,
              ),
              width: double.maxFinite,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Comments',
                    style: TextStyle(
                      color: blackPrimary,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '4.3K Comments',
                    style: TextStyle(
                      color: grayMed,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 2,
              color: grayMed,
              width: double.maxFinite,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: spacing(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/new/images/border.png',
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              padding: spacing(
                                horizontal: 2,
                                vertical: 2,
                              ),
                              decoration: const BoxDecoration(),
                              child: Container(
                                padding: spacing(
                                  horizontal: 3,
                                  vertical: 3,
                                ),
                                child: CircleAvatar(
                                  foregroundImage:
                                      AssetImage('assets/new/images/7.png'),
                                  radius: width * 0.07,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Gwen Stacy',
                                      style: TextStyle(
                                        fontSize: textSm,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '1 day',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: grayMed,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Image.asset(
                                    'assets/new/icons/more_h.png',
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.7,
                            child: const Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                            margin: spacing(
                              vertical: 10,
                            ),
                            child: Container(
                              width: width * 0.75,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: spacing(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        margin: spacing(
                                          horizontal: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: grayLight,
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: Text(
                                          'React',
                                          style: TextStyle(
                                            color: grayPrimary,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: spacing(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        margin: spacing(
                                          horizontal: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: grayLight,
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: Text(
                                          'Reply',
                                          style: TextStyle(
                                            color: grayPrimary,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    margin: spacing(
                                      horizontal: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: grayLight,
                                      borderRadius: borderRadius(width),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            'assets/new/icons/heavy_smil.png'),
                                        Image.asset(
                                            'assets/new/icons/small_heart.png'),
                                        Text(
                                          '23',
                                          style: TextStyle(
                                            color: grayPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: spacing(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/new/images/border.png',
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              padding: spacing(
                                horizontal: 2,
                                vertical: 2,
                              ),
                              decoration: const BoxDecoration(),
                              child: Container(
                                padding: spacing(
                                  horizontal: 3,
                                  vertical: 3,
                                ),
                                child: CircleAvatar(
                                  foregroundImage:
                                      AssetImage('assets/new/images/7.png'),
                                  radius: width * 0.07,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Gwen Stacy',
                                      style: TextStyle(
                                        fontSize: textSm,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '1 day',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: grayMed,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Image.asset(
                                    'assets/new/icons/more_h.png',
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.7,
                            child: const Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                            margin: spacing(
                              vertical: 10,
                            ),
                            child: Container(
                              width: width * 0.75,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: spacing(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        margin: spacing(
                                          horizontal: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: grayLight,
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 17,
                                              height: 17,
                                              child: Image.asset(
                                                  'assets/new/gif/weary_face.gif'),
                                            ),
                                            Text(
                                              'Sad',
                                              style: TextStyle(
                                                color: grayPrimary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: spacing(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        margin: spacing(
                                          horizontal: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: grayLight,
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: Text(
                                          'Reply',
                                          style: TextStyle(
                                            color: grayPrimary,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    margin: spacing(
                                      horizontal: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: grayLight,
                                      borderRadius: borderRadius(width),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            'assets/new/icons/heavy_smil.png'),
                                        Image.asset(
                                            'assets/new/icons/small_heart.png'),
                                        Text(
                                          '23',
                                          style: TextStyle(
                                            color: grayPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: spacing(
                vertical: 10,
                horizontal: 10,
              ),
              child: Row(
                children: [
                  Container(
                    width: width * 0.1,
                    height: 2,
                    color: grayMed,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Hide Replay',
                    style: TextStyle(
                      color: grayPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: spacing(
                horizontal: 10,
              ),
              margin: EdgeInsets.only(left: width * 0.1),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/new/images/border.png',
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              padding: spacing(
                                horizontal: 2,
                                vertical: 2,
                              ),
                              decoration: const BoxDecoration(),
                              child: Container(
                                padding: spacing(
                                  horizontal: 3,
                                  vertical: 3,
                                ),
                                child: CircleAvatar(
                                  foregroundImage:
                                      AssetImage('assets/new/images/7.png'),
                                  radius: width * 0.07,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.65,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Gwen Stacy',
                                      style: TextStyle(
                                        fontSize: textSm,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '1 day',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: grayMed,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Image.asset(
                                    'assets/new/icons/more_h.png',
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.65,
                            child: const Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                            margin: spacing(
                              vertical: 10,
                            ),
                            child: Container(
                              width: width * 0.65,
                              child: Row(
                                children: [
                                  Container(
                                    padding: spacing(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    margin: spacing(
                                      horizontal: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: grayLight,
                                      borderRadius: borderRadius(width),
                                    ),
                                    child: Row(
                                      children: [
                                        // Container(
                                        //   width: 17,
                                        //   height: 17,
                                        //   child: Image.asset(
                                        //       'assets/new/gif/weary_face.gif'),
                                        // ),
                                        Text(
                                          'React',
                                          style: TextStyle(
                                            color: grayPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    margin: spacing(
                                      horizontal: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: grayLight,
                                      borderRadius: borderRadius(width),
                                    ),
                                    child: Text(
                                      'Reply',
                                      style: TextStyle(
                                        color: grayPrimary,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: spacing(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/new/images/border.png',
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              padding: spacing(
                                horizontal: 2,
                                vertical: 2,
                              ),
                              decoration: const BoxDecoration(),
                              child: Container(
                                padding: spacing(
                                  horizontal: 3,
                                  vertical: 3,
                                ),
                                child: CircleAvatar(
                                  foregroundImage:
                                      AssetImage('assets/new/images/7.png'),
                                  radius: width * 0.07,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Gwen Stacy',
                                      style: TextStyle(
                                        fontSize: textSm,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '1 day',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: grayMed,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Image.asset(
                                    'assets/new/icons/more_h.png',
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.7,
                            child: const Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                            margin: spacing(
                              vertical: 10,
                            ),
                            child: Container(
                              width: width * 0.75,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: spacing(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        margin: spacing(
                                          horizontal: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: grayLight,
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: Text(
                                          'React',
                                          style: TextStyle(
                                            color: grayPrimary,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: spacing(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        margin: spacing(
                                          horizontal: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: grayLight,
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: Text(
                                          'Reply',
                                          style: TextStyle(
                                            color: grayPrimary,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    margin: spacing(
                                      horizontal: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: grayLight,
                                      borderRadius: borderRadius(width),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            'assets/new/icons/heavy_smil.png'),
                                        Image.asset(
                                            'assets/new/icons/small_heart.png'),
                                        Text(
                                          '23',
                                          style: TextStyle(
                                            color: grayPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: spacing(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/new/images/border.png',
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              padding: spacing(
                                horizontal: 2,
                                vertical: 2,
                              ),
                              decoration: const BoxDecoration(),
                              child: Container(
                                padding: spacing(
                                  horizontal: 3,
                                  vertical: 3,
                                ),
                                child: CircleAvatar(
                                  foregroundImage:
                                      AssetImage('assets/new/images/7.png'),
                                  radius: width * 0.07,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Gwen Stacy',
                                      style: TextStyle(
                                        fontSize: textSm,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '1 day',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: grayMed,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Image.asset(
                                    'assets/new/icons/more_h.png',
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.7,
                            child: const Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                            margin: spacing(
                              vertical: 10,
                            ),
                            child: Container(
                              width: width * 0.75,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: spacing(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        margin: spacing(
                                          horizontal: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: grayLight,
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 17,
                                              height: 17,
                                              child: Image.asset(
                                                  'assets/new/gif/weary_face.gif'),
                                            ),
                                            Text(
                                              'Sad',
                                              style: TextStyle(
                                                color: grayPrimary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: spacing(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        margin: spacing(
                                          horizontal: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: grayLight,
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: Text(
                                          'Reply',
                                          style: TextStyle(
                                            color: grayPrimary,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    margin: spacing(
                                      horizontal: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: grayLight,
                                      borderRadius: borderRadius(width),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            'assets/new/icons/heavy_smil.png'),
                                        Image.asset(
                                            'assets/new/icons/small_heart.png'),
                                        Text(
                                          '23',
                                          style: TextStyle(
                                            color: grayPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: spacing(
                vertical: 10,
                horizontal: 10,
              ),
              child: Row(
                children: [
                  Container(
                    width: width * 0.1,
                    height: 2,
                    color: grayMed,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Hide Replay',
                    style: TextStyle(
                      color: grayPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: spacing(
                horizontal: 10,
              ),
              margin: EdgeInsets.only(left: width * 0.1),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/new/images/border.png',
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              padding: spacing(
                                horizontal: 2,
                                vertical: 2,
                              ),
                              decoration: const BoxDecoration(),
                              child: Container(
                                padding: spacing(
                                  horizontal: 3,
                                  vertical: 3,
                                ),
                                child: CircleAvatar(
                                  foregroundImage:
                                      AssetImage('assets/new/images/7.png'),
                                  radius: width * 0.07,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.65,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Gwen Stacy',
                                      style: TextStyle(
                                        fontSize: textSm,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '1 day',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: grayMed,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Image.asset(
                                    'assets/new/icons/more_h.png',
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.65,
                            child: const Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                            margin: spacing(
                              vertical: 10,
                            ),
                            child: Container(
                              width: width * 0.65,
                              child: Row(
                                children: [
                                  Container(
                                    padding: spacing(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    margin: spacing(
                                      horizontal: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: grayLight,
                                      borderRadius: borderRadius(width),
                                    ),
                                    child: Row(
                                      children: [
                                        // Container(
                                        //   width: 17,
                                        //   height: 17,
                                        //   child: Image.asset(
                                        //       'assets/new/gif/weary_face.gif'),
                                        // ),
                                        Text(
                                          'React',
                                          style: TextStyle(
                                            color: grayPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: spacing(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    margin: spacing(
                                      horizontal: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: grayLight,
                                      borderRadius: borderRadius(width),
                                    ),
                                    child: Text(
                                      'Reply',
                                      style: TextStyle(
                                        color: grayPrimary,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                margin: spacing(
                  horizontal: width * 0.05,
                ),
                padding: spacing(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: grayMed,
                  borderRadius: borderRadius(width),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width * 0.75,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Type a comment',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      padding: spacing(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: orangePrimary,
                        borderRadius: borderRadius(width),
                      ),
                      child: Icon(
                        Icons.send,
                        color: whitePrimary,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
