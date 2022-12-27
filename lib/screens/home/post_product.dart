// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:svg_icon/svg_icon.dart';

import '../../utils/constant.dart';

class PostProduct extends StatefulWidget {
  final String name;
  final String productName;
  final String description;
  final String stock_amount;
  final String location;
  final String avatar;
  final String postTime;
  final List<dynamic> productImage;
  final String price;
  final String likes;
  final String comments;
  final String shares;

  const PostProduct({
    Key? key,
    required this.name,
    required this.productName,
    required this.description,
    required this.stock_amount,
    required this.location,
    required this.avatar,
    required this.postTime,
    required this.productImage,
    required this.price,
    required this.likes,
    required this.comments,
    required this.shares,
  }) : super(key: key);

  @override
  State<PostProduct> createState() => _PostProductState();
}

class _PostProductState extends State<PostProduct> {
  int currentImage = 0;
  void imageSliderRight() {
    if (widget.productImage.length - 1 == currentImage) {
      setState(() {
        currentImage = 0;
      });
    } else {
      setState(() {
        currentImage += 1;
      });
    }
  }

  void imageSliderLeft() {
    if (currentImage == 0) {
      setState(() {
        currentImage = widget.productImage.length - 1;
      });
    } else {
      setState(() {
        currentImage -= 1;
      });
    }
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            width * 0.02,
          ),
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                foregroundImage: NetworkImage(widget.avatar),
              ),
              title: Row(
                children: [
                  Container(
                    width: width * 0.22,
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
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
                        color: accent,
                        borderRadius: borderRadius(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
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
                        width: width * 0.43,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width * 0.3,
                              child: FittedBox(
                                child: Text(
                                  'Added products for sale',
                                  style: TextStyle(
                                    color: darkGray,
                                    fontSize: 10,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down_outlined,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Text(widget.postTime),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Container(
                    width: width * 0.025,
                    child: const SvgIcon(
                      'assets/svg/globe.svg',
                      width: 12,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: accent,
                    size: 16,
                  )
                ],
              ),
            ),
            Container(
              child: Stack(
                children: [
                  Image.network(
                    widget.productImage[currentImage]['image'],
                    fit: BoxFit.fitWidth,
                  ),
                  widget.productImage.length > 1
                      ? Positioned(
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Container(
                              padding: spacing(
                                horizontal: 20,
                              ),
                              width: width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      imageSliderLeft();
                                    },
                                    child: Container(
                                      padding: spacing(
                                        horizontal: 5,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: darkGray,
                                        borderRadius: borderRadius(width),
                                      ),
                                      child: Icon(
                                        Icons.keyboard_arrow_left_rounded,
                                        color: white,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      imageSliderRight();
                                    },
                                    child: Container(
                                      padding: spacing(
                                        horizontal: 5,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: darkGray,
                                        borderRadius: borderRadius(width),
                                      ),
                                      child: Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        color: white,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: spacing(
                horizontal: 10,
                vertical: 0,
              ),
              width: double.maxFinite,
              child: Text(
                widget.productName,
                style: TextStyle(
                  fontSize: textSm,
                ),
              ),
            ),
            Padding(
              padding: spacing(
                horizontal: 10,
                vertical: 0,
              ),
              child: Row(
                children: [
                  Text('${widget.location}'),
                  const SizedBox(
                    width: 7,
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: accent,
                        borderRadius: borderRadius(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    width: width * 0.43,
                    child: Text(
                      '${widget.stock_amount} In stock',
                      style: TextStyle(
                        color: accent,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.maxFinite,
              height: 1,
              color: darkGray,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: spacing(
                horizontal: 10,
                vertical: 0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/product/bookmark.svg',
                        width: width * 0.05,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Contact seller')
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/product/bookmark3.svg',
                        width: width * 0.05,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Price ${widget.price} (GBP)')
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/product/bookmark.svg',
                        width: width * 0.05,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Type New')
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/product/fast-delivery.svg',
                        width: width * 0.05,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Standard Delivery | 7 - 10 Days')
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/product/fast-delivery.svg',
                        width: width * 0.05,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.75,
                        child: const Text(
                          'A lovely set of art pens, pencils and paint And much more',
                          style: TextStyle(
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: width * 0.05,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.75,
                        child: Html(
                          data: widget.description,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: height * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: orange,
                    ),
                    child: Text(
                      'View details',
                      style: TextStyle(
                        color: white,
                        fontSize: textSm,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: spacing(
                horizontal: width * 0.01,
                vertical: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        child: Image.asset(
                          'assets/icons/like1.png',
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Likes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${widget.likes}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        child: Image.asset(
                          'assets/icons/comment1.png',
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Comments',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${widget.comments}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        child: Image.asset(
                          'assets/icons/revibe1.png',
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Revibed',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${widget.shares}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
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
