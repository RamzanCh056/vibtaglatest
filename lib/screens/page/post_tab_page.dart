import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import '../../utils/constant.dart';
import '../home/comment.dart';
import '../home/revibe.dart';

class PostTabPage extends StatefulWidget {
  const PostTabPage({super.key});

  @override
  State<PostTabPage> createState() => _PostTabPageState();
}

class _PostTabPageState extends State<PostTabPage> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return Container(
    width: double.maxFinite,
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
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            child: Image.asset(
              'assets/images/post_cover.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: spacing(
              horizontal: 5,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: whiteSecondary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: grayLight,
                    borderRadius: borderRadius(width),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      gap(w: 5),
                      Text(
                        'You, R and 20 other(s)',
                        style: TextStyle(
                          color: grayMed,
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: spacing(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Text(
                    "5 Comments | 4 Revibed",
                    style: TextStyle(
                      color: grayMed,
                      fontSize: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.03,
                      height: width * 0.03,
                      child: Image.asset(
                        'assets/new/icons/heart.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'React',
                      style: TextStyle(
                        color: grayMed,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Comments(
                    context: context,
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.03,
                      height: width * 0.03,
                      child: Image.asset(
                        'assets/new/icons/comment.png',
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Comment',
                      style: TextStyle(
                        fontSize: 12,
                        color: grayMed,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Revibe(context: context);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.03,
                      height: width * 0.03,
                      child: Image.asset(
                        'assets/new/icons/revibe.png',
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Revibe',
                      style: TextStyle(
                        fontSize: 12,
                        color: grayMed,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            width: width * 0.95,
            height: 2,
            color: medGray,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10,
            ),
            child: Html(
              data:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting #Friends #atWork',
              style: {
                "body": Style(
                  fontSize: FontSize(12.0),
                  textOverflow: TextOverflow.ellipsis,
                  color: Colors.black54,
                  maxLines: 3,
                ),
              },
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
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
                        foregroundImage: const AssetImage(
                          'assets/new/images/user.png',
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
                        Row(
                          children: [
                            FittedBox(
                              child: Text(
                                'Mark Henry',
                                style: TextStyle(
                                  color: blackPrimary,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            gap(
                              w: 5,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '1hr ago',
                              style: TextStyle(
                                color: grayMed,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  width: width * 0.08,
                  height: width * 0.08,
                  child: Image.asset(
                    'assets/new/icons/more_h.png',
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
  }
}

