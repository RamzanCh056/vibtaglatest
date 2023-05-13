import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:vibetag/screens/home/post_types/post_file.dart';
import 'package:vibetag/screens/home/post_types/widgets/post_bar.dart';
import 'package:vibetag/utils/constant.dart';

import '../../../methods/api.dart';
import '../../../widgets/bottom_modal_sheet_widget.dart';
import '../../hast_tag/tred_screen.dart';

class PostAds extends StatefulWidget {
  final dynamic post;

  const PostAds({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<PostAds> createState() => _PostAdsState();
}

class _PostAdsState extends State<PostAds> {
  bool isShowReactions = false;
  bool isAdded = false;
  int reactionValue = 0;
  String responseData = '';
  int totalLikes = 0;
  int userLike = 0;

  void reactOnPost() async {
    setState(() {
      isAdded = false;
    });
    userLike = 0;
    final data = {
      'type': 'react_story',
      'post_id': widget.post['id'].toString(),
      'user_id': loginUserId.toString(),
      'reaction': reactionValue.toString(),
    };
    final result = await API().postData(data);
    final response = jsonDecode(result.body)['status'];
    if (response == 200) {
      userLike = 1;
    }
    setState(() {
      isAdded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);

    return Container(
      margin: spacing(
        vertical: 10,
      ),
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(
          width * 0.02,
        ),
      ),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            width * 0.02,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            gap(h: 10),
            Container(
              width: width,
              height: height * 0.08,
              margin: spacing(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: width * 0.12,
                        height: width * 0.12,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: borderRadius(width),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                orangePrimary,
                                graySecondary,
                              ],
                            )),
                        padding: const EdgeInsets.all(2),
                        child: CircleAvatar(
                          radius: width * 0.06,
                          foregroundImage: NetworkImage(
                            widget.post['dp'].contains(serverUrl)
                                ? widget.post['dp']
                                : '${serverUrl}${widget.post['dp']}',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.post['name'],
                            style: TextStyle(
                              fontSize: 12,
                              color: blackPrimary,
                            ),
                          ),
                          Text(
                            'sponsorsd',
                            style: TextStyle(
                              color: grayMed,
                              fontSize: 10,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      createBottomModalSheet(
                        context: context,
                        screen: PostBottomBar(
                          is_publisher:
                              widget.post['publisher']['user_id'].toString() ==
                                  loginUserId,
                        ),
                      );
                    },
                    child: Container(
                      width: width * 0.08,
                      height: width * 0.08,
                      child: Image.asset(
                        'assets/new/icons/more_h.png',
                      ),
                    ),
                  )
                ],
              ),
            ),
            gap(h: 10),
            Html(
              data: widget.post['description'],
              onAnchorTap: (str, rndr, map, e) {
                pushRoute(
                  context: context,
                  screen: HashTrend(
                      hashTag: e!.text.toString().contains('#')
                          ? e.text.toString().replaceFirst(RegExp(r'#'), '')
                          : e.text.toString()),
                );
              },
              style: {
                "body": Style(
                  fontSize: FontSize(12.0),
                  textOverflow: TextOverflow.ellipsis,
                  color: Colors.black54,
                  maxLines: 3,
                ),
              },
            ),
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: grayMed,
                      ),
                      child: Center(
                        child: postFile(
                          file: widget.post['ad_media'],
                          thumbnail: widget.post['dp'].contains(serverUrl)
                              ? widget.post['dp']
                              : '${serverUrl}${widget.post['dp']}',
                          isAds: true,
                          post_id: widget.post['id'],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            gap(h: 10),
            Center(
              child: InkWell(
                onTap: () {
                  launchUrl(Uri.parse('${widget.post['url']}'));
                },
                child: Container(
                  width: width * 0.95,
                  padding: spacing(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: borderRadius(5),
                      color: HexColor('${widget.post['btncolor']}')),
                  child: Text(
                    widget.post['btn'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
