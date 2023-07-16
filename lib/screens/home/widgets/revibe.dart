// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';
import 'package:social_share/social_share.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/home/widgets/revibe_on_group.dart';
import 'package:vibetag/screens/home/widgets/revibe_on_page.dart';

import 'package:vibetag/screens/home/widgets/share_widget.dart';
import 'package:whatsapp_share/whatsapp_share.dart';

import '../../../utils/constant.dart';
import '../../../widgets/bottom_modal_sheet_widget.dart';

class Revibe extends StatefulWidget {
  final Map<String, dynamic> post;
  const Revibe({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<Revibe> createState() => _RevibeState();
}

class _RevibeState extends State<Revibe> {
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
  bool shareNowLoading = false;

  shareNow() async {
    setState(() {
      shareNowLoading = true;
    });
    final data = {
      'type': 'revibe',
      'sub_type': 'revibe_post',
      'post_on': 'timeline',
      'type_id': '${loginUserId}',
      'post_id': widget.post['post_id'],
      'user_id': '${loginUserId}',
      'text': revibeText.text,
    };
    final result = await API().postData(data);
    final response = jsonDecode(result.body);

    setState(() {
      shareNowLoading = false;
    });
    if (response['status'].toString() == '200') {
      pop(context);
      ToastMessage(message: 'Revibed Successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: borderRadius(7),
        boxShadow: boxShadow,
      ),
      child: SingleChildScrollView(
        physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
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
                    'Revibe',
                    style: TextStyle(
                      color: blackPrimary,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '${getInK(
                      number: int.parse(
                        widget.post['post_shares'].toString(),
                      ),
                    )} Revibed',
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
            shareNowLoading
                ? loadingSpinner()
                : Container(
                    height: height * 0.9,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.maxFinite,
                            margin: spacing(horizontal: 10),
                            child: TextFormField(
                              controller: revibeText,
                              decoration: InputDecoration(
                                hintText: 'Type here',
                                border: InputBorder.none,
                              ),
                              maxLines: 4,
                            ),
                          ),
                          gap(h: 10),
                          InkWell(
                            onTap: () {
                              shareNow();
                            },
                            child: ShareOptions(
                              width: width,
                              height: height,
                              iconsPath: 'assets/new/icons/share_arrow.png',
                              title: 'Timeline',
                            ),
                          ),
                          ShareOptions(
                            width: width,
                            height: height,
                            iconsPath: 'assets/images/share_to_story.png',
                            title: 'Share to your Story',
                          ),
                          InkWell(
                            onTap: () {
                              pop(context);
                              createBottomModalSheet(
                                context: context,
                                screen: RevibeOnPage(
                                  post: widget.post,
                                ),
                              );
                            },
                            child: ShareOptions(
                              width: width,
                              height: height,
                              iconsPath: 'assets/images/page_revibe.png',
                              title: 'Share to your Page',
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pop(context);
                              createBottomModalSheet(
                                context: context,
                                screen: RevibeOnGroup(
                                  post: widget.post,
                                ),
                              );
                            },
                            child: ShareOptions(
                              width: width,
                              height: height,
                              iconsPath: 'assets/images/group_revibe.png',
                              title: 'Share to your Group',
                            ),
                          ),
                          ShareOptions(
                            width: width,
                            height: height,
                            iconsPath: 'assets/new/icons/chat_b.png',
                            title: 'Share in Chat',
                          ),
                          gap(
                            h: 10,
                          ),
                          Container(
                            width: double.maxFinite,
                            height: height * 0.4,
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
                                childAspectRatio: 0.9,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: 8,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () async {
                                    if (i == 0) {
                                      await FlutterClipboard.copy(
                                          widget.post['url'].toString());
                                      ToastMessage(
                                          message: 'Link copied successfully!');
                                      pop(context);
                                    } else if (i == 1) {
                                      bool? isInstalled =
                                          await WhatsappShare.isInstalled();

                                      if (isInstalled!) {
                                        await WhatsappShare.share(
                                          linkUrl:
                                              widget.post['url'].toString(),
                                          phone: '+923078086783',
                                        );
                                      } else {
                                        ToastMessage(
                                            message:
                                                'WhatsApp isn\'t installed on your phone!');
                                      }
                                    } else if (i == 2) {
                                      await Share.share(
                                        widget.post['url'].toString(),
                                      );
                                    } else if (i == 4) {
                                      String? response =
                                          await SocialShare.shareTwitter(
                                        widget.post['postText'].toString(),
                                        url: widget.post['url'].toString(),
                                      );
                                      print(response);
                                    } else if (i == 7) {
                                      String? response =
                                          await SocialShare.shareSms(
                                        widget.post['postText'].toString(),
                                        url: widget.post['url'].toString(),
                                      );
                                      print(response);
                                    }
                                  },
                                  child: Container(
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
                                              Text(
                                                shareApp[i]['App'],
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              )
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              Container(
                                                width: width * 0.15,
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                  shareApp[i]['image'],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              gap(h: 5),
                                              Text(
                                                shareApp[i]['App'],
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              )
                                            ],
                                          ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
