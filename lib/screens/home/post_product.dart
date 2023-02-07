// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

import 'package:vibetag/screens/home/comment.dart';
import 'package:vibetag/screens/home/feelingWidet.dart';
import 'package:vibetag/screens/home/product_features.dart';
import 'package:vibetag/screens/home/revibe.dart';

import '../../methods/api.dart';
import '../../utils/constant.dart';
import '../profile/profile.dart';

class PostProduct extends StatefulWidget {
  final dynamic post;

  const PostProduct({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<PostProduct> createState() => _PostProductState();
}

class _PostProductState extends State<PostProduct> {
  int currentImage = 0;
  // void imageSliderRight() {
  //   if (widget.post['product']['images'].length - 1 == currentImage) {
  //     setState(() {
  //       currentImage = 0;
  //     });
  //   } else {
  //     setState(() {
  //       currentImage += 1;
  //     });
  //   }
  // }

  // void imageSliderLeft() {
  //   if (currentImage == 0) {
  //     setState(() {
  //       currentImage = widget.post['product']['images'].length - 1;
  //     });
  //   } else {
  //     setState(() {
  //       currentImage -= 1;
  //     });
  //   }
  // }

  bool isShowReactions = false;
  bool isAdded = false;
  int reactionValue = 0;
  String responseData = '';
  int totalLikes = 0;
  int userLike = 0;

  final List<String> reactions = [
    'assets/new/gif/thumbs_up.gif',
    'assets/new/gif/sparkling_heart.gif',
    'assets/new/gif/squinting_face.gif',
    'assets/new/gif/hushed_face.gif',
    'assets/new/gif/weary_face.gif',
    'assets/new/gif/pouting_face.gif',
    'assets/new/gif/weary_face.gif',
    'assets/new/gif/broken_heart.gif',
  ];

  void reactOnPost() async {
    setState(() {
      isAdded = false;
    });
    userLike = 0;
    final data = {
      'type': 'react_story',
      'post_id': widget.post['post_id'],
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
    totalLikes =
        int.parse(widget.post['reaction']['count'].toString()) + userLike;
    return Container(
      margin: spacing(
        vertical: 5,
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            width * 0.02,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height * 0.45,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: widget.post['product']['images'].length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Container(
                    width: widget.post['product']['images'].length > 1
                        ? width * 0.9
                        : width,
                    margin: spacing(
                      horizontal:
                          widget.post['product']['images'].length > 1 ? 10 : 0,
                      vertical: 0,
                    ),
                    height: double.maxFinite,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius:
                              widget.post['product']['images'].length > 1
                                  ? borderRadius(7)
                                  : borderRadius(0),
                          child: Image.network(
                            widget.post['product']['images'][i]['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        widget.post['product']['images'].length > 1
                            ? Positioned(
                                top: 10,
                                right: 10,
                                child: Container(
                                  padding: spacing(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius(5),
                                    color: lightBg,
                                  ),
                                  child: Text(
                                    '${i + 1}/${widget.post['product']['images'].length}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: white,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  );
                },
              ),
            ),
            widget.post['is_offer_product'] != null
                ? Container(
                    width: double.infinity,
                    height: height * 0.04,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(100, 255, 146, 0),
                    ),
                    padding: spacing(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.post['is_offer_product']['text']}',
                          style: TextStyle(
                            color: orangePrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.post['is_offer_product']['expiry']}',
                          style: TextStyle(
                            color: grayMed,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                : gap(),
            Container(
              padding: spacing(
                vertical: 5,
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.maxFinite,
                          child: Text(
                            widget.post['product']['name'],
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: spacing(
                            vertical: 3,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '${widget.post['product']['location']}',
                                style: TextStyle(
                                  color: grayMed,
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: grayMed,
                                    borderRadius: borderRadius(10),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Container(
                                child: Text(
                                  '${widget.post['product']['amount_stock']} In stock',
                                  style: TextStyle(
                                    color: grayMed,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\£${widget.post['product']['sale_price']}',
                        style: TextStyle(
                          fontSize: 12,
                          color: orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      gap(h: 2),
                      Text(
                        '${widget.post['product']['sale_price']}\% \£${widget.post['product']['price']}',
                        style: TextStyle(
                          fontSize: 12,
                          color: grayMed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            gap(h: 15),
            Container(
              height: height * 0.08,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductFeature(
                      title: 'Condition',
                      text: widget.post['product']['type'] != '0'
                          ? 'Used'
                          : 'New',
                    ),
                    ProductFeature(
                        title: 'Returnable',
                        text: '${widget.post['product']['returnable']}'),
                    ProductFeature(
                        title: 'Standard Delivery', text: '2 - 5 Days'),
                    ProductFeature(
                        title: 'Model Number',
                        text: '${widget.post['product']['model_number']}'),
                    ProductFeature(
                        title: 'Stock',
                        text: '${widget.post['product']['amount_stock']}'),
                  ],
                ),
              ),
            ),
            gap(h: 15),
            Container(
              width: double.maxFinite,
              height: 1,
              color: darkGray,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: spacing(
                horizontal: 15,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: whiteSecondary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Image.asset('assets/new/icons/heavy_smil.png'),
                        Image.asset('assets/new/icons/small_heart.png'),
                        gap(w: 5),
                        Text(
                          "${totalLikes}",
                          style: TextStyle(
                            color: grayMed,
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
                    child: Text(
                      "${widget.post['post_comments']} Comments | ${widget.post['post_shares']} Revibed",
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
                  onTap: () {
                    setState(() {
                      isShowReactions = !isShowReactions;
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.03,
                        height: width * 0.03,
                        child: Image.asset(
                          'assets/new/icons/heart.png',
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
                      Container(
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
            isShowReactions
                ? Container(
                    width: width * 0.7,
                    height: width * 0.11,
                    padding: spacing(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    margin: spacing(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                        color: white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(56, 0, 0, 0),
                            offset: Offset.zero,
                            spreadRadius: 1,
                            blurRadius: 3,
                          ),
                        ],
                        borderRadius: borderRadius(5)),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: reactions.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              isShowReactions = !isShowReactions;
                              reactionValue = i + 1;
                            });
                            reactOnPost();
                          },
                          child: Container(
                            width: width * 0.08,
                            height: width * 0.08,
                            child: Image.asset(reactions[i]),
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
            widget.post['parent_id'] != '0'
                ? Container(
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
                                  widget.post['post_owner_data']['avatar'],
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
                                    Container(
                                      width: width * 0.25,
                                      child: Text(
                                        widget.post['post_owner_data']['name'],
                                        style: TextStyle(
                                          color: blackPrimary,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    postFeeling(
                                        width: width,
                                        feeling: 'Added a product for sale',
                                        start: '')
                                  ],
                                ),
                                gap(h: 5),
                                Row(
                                  children: [
                                    Text(
                                      readTimestamp(int.parse(widget
                                          .post['post_owner_data']['time'])),
                                      style: TextStyle(
                                        color: grayMed,
                                        fontSize: 10,
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
                : gap(),
            gap(
              h: 10,
            ),
            widget.post['parent_id'] != '0'
                ? Row(
                    children: [
                      Container(
                        width: width * 0.5,
                        height: height * 0.04,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: HexColor('#FFF5E7'),
                        ),
                        child: Text(
                          'Contact Now',
                          style: TextStyle(
                            color: orange,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.5,
                        height: height * 0.04,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: orange,
                        ),
                        child: Text(
                          'View More',
                          style: TextStyle(
                            color: white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                : gap(),
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
                      InkWell(
                        onTap: () {
                          pushRoute(
                            context: context,
                            screen: const Profile(),
                          );
                        },
                        child: Container(
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
                                widget.post['publisher']['avatar']),
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
                              Container(
                                width: width * 0.25,
                                child: Text(
                                  widget.post['publisher']['name'] != null
                                      ? widget.post['publisher']['name']
                                      : '${widget.post['publisher']['first_name']} ${widget.post['publisher']['last_name']}',
                                  style: TextStyle(
                                    color: blackPrimary,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              gap(
                                w: 4,
                              ),
                              widget.post['parent_id'] != '0'
                                  ? postFeeling(
                                      width: width,
                                      feeling: 'Revibed a post',
                                      start: '')
                                  : Row(
                                      children: [
                                        Container(
                                          width: 4,
                                          height: 4,
                                          decoration: BoxDecoration(
                                              color: grayMed,
                                              borderRadius:
                                                  borderRadius(width)),
                                        ),
                                        gap(w: 4),
                                        Row(
                                          children: [
                                            Text(
                                              'Like',
                                              style: TextStyle(
                                                color: blue,
                                                fontSize: 10,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Container(
                                              width: width * 0.3,
                                              child: Text(
                                                'Added products for sale',
                                                style: TextStyle(
                                                  color: darkGray,
                                                  fontSize: 10,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                widget.post['post_time'],
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
            ),
            widget.post['parent_id'] == '0'
                ? Row(
                    children: [
                      Container(
                        width: width * 0.5,
                        height: height * 0.05,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: HexColor('#FFF5E7'),
                        ),
                        child: Text(
                          'Contact Now',
                          style: TextStyle(
                            color: orange,
                            fontSize: textSm,
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.5,
                        height: height * 0.05,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: orange,
                        ),
                        child: Text(
                          'View More',
                          style: TextStyle(
                            color: white,
                            fontSize: textSm,
                          ),
                        ),
                      ),
                    ],
                  )
                : gap(),
            gap(h: 10)
          ],
        ),
      ),
    );
  }
}
