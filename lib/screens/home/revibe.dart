import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vibetag/screens/home/share_widget.dart';
import '../../utils/constant.dart';

Revibe({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  List shareApp = [
    {
      'App': 'Copy Link',
      'image': 'assets/new/images/copy.png',
    },
    {
      'App': 'WhatsApp',
      'image': 'assets/new/images/whatsapp.png',
    },
    {
      'App': 'Facebook',
      'image': 'assets/new/images/facebook.png',
    },
    {
      'App': 'Messenger',
      'image': 'assets/new/images/messenger.png',
    },
    {
      'App': 'Twitter',
      'image': 'assets/new/images/twitter.png',
    },
    {
      'App': 'Instagram',
      'image': 'assets/new/images/instagram.png',
    },
    {
      'App': 'Skype',
      'image': 'assets/new/images/skype.png',
    },
    {
      'App': 'Message',
      'image': 'assets/new/images/message.png',
    },
  ];
  return showBarModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: height * 0.8,
        child: SingleChildScrollView(
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
                      'Share',
                      style: TextStyle(
                        color: blackPrimary,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '4.3K Revibed',
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
              gap(
                h: 10,
              ),
              Container(
                child: Column(
                  children: [
                    ShareOptions(
                      width: width,
                      height: height,
                      iconsPath: 'assets/new/icons/share_arrow.png',
                      title: 'Share now',
                    ),
                    ShareOptions(
                      width: width,
                      height: height,
                      iconsPath: 'assets/new/icons/send_b.png',
                      title: 'Share a Feed',
                    ),
                    ShareOptions(
                      width: width,
                      height: height,
                      iconsPath: 'assets/new/icons/round_plus.png',
                      title: 'Share to your Story',
                    ),
                    ShareOptions(
                      width: width,
                      height: height,
                      iconsPath: 'assets/new/icons/chat_b.png',
                      title: 'Share in Chat',
                    ),
                    gap(
                      h: 20,
                    ),
                    Container(
                      width: double.maxFinite,
                      height: height * 0.3,
                      margin: spacing(
                        horizontal: 10,
                        vertical: 0,
                      ),
                      padding: spacing(
                        horizontal: 0,
                        vertical: 20,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: grayLight,
                        borderRadius: borderRadius(18),
                      ),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: 8,
                        itemBuilder: (context, i) {
                          return Container(
                            child: i < 1
                                ? Column(
                                    children: [
                                      Container(
                                        padding: spacing(
                                          horizontal: 10,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: white,
                                          borderRadius: borderRadius(5),
                                        ),
                                        width: width * 0.14,
                                        child: Image.asset(
                                          shareApp[i]['image'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      gap(h: 5),
                                      Text(shareApp[i]['App'])
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Container(
                                        width: width * 0.15,
                                        child: Image.asset(
                                          shareApp[i]['image'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      gap(h: 5),
                                      Text(shareApp[i]['App'])
                                    ],
                                  ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
