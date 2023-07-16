// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:vibetag/screens/page/review_widget.dart';

import '../../utils/constant.dart';

class PageReviews extends StatefulWidget {
  final String page_id;
  const PageReviews({
    Key? key,
    required this.page_id,
  }) : super(key: key);

  @override
  State<PageReviews> createState() => _PageReviewsState();
}

class _PageReviewsState extends State<PageReviews> {
  List<dynamic> reviews = [];
  List<Widget> reviewWidgets = [];
  bool isLoading = false;
  int totalReviews = 0;
  @override
  void initState() {
    super.initState();
    getPageReviews();
  }

  getPageReviews() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'get_page_rating',
      'action': 'get_page_reviews',
      'page_id': widget.page_id,
      'limit': '10',
    };
    final result = await API().postData(data);
    reviews = jsonDecode(result.body)['data'];
    await PostMethods().getCountries();

    print(reviews);
    for (var review in reviews) {
      if (review['valuation'] != null) {
        totalReviews += int.parse(review['valuation'].toString());
      }
      reviewWidgets.add(
        ReviewWiget(review: review),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loadingSpinner()
        : reviews.length == 0
            ? Center(
                child: Text('No review yet'),
              )
            : Container(
                width: width,
                height: height * 0.7,
                color: backgroundColor,
                child: Column(
                  children: [
                    gap(h: 10),
                    Container(
                      height: height * 0.1,
                      margin: spacing(
                        horizontal: 7,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: borderRadius(7),
                        color: white,
                      ),
                      child: Center(
                        child: Table(
                          border: TableBorder(
                            verticalInside: BorderSide(
                              width: 1,
                              color: grayMed,
                            ),
                          ),
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Positive Seller',
                                        style: TextStyle(
                                          color: blackLight,
                                          fontSize: 12,
                                        ),
                                      ),
                                      gap(h: 7),
                                      const Text(
                                        '70%',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Ship on Time',
                                        style: TextStyle(
                                          color: blackLight,
                                          fontSize: 12,
                                        ),
                                      ),
                                      gap(h: 7),
                                      const Text(
                                        '91%',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Response Rate',
                                          style: TextStyle(
                                            color: blackLight,
                                            fontSize: 12,
                                          ),
                                        ),
                                        gap(h: 7),
                                        const Text(
                                          '100%',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    gap(h: 10),
                    Container(
                      height: height * 0.07,
                      margin: spacing(
                        horizontal: 7,
                      ),
                      padding: spacing(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: borderRadius(7),
                        color: white,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: orangePrimary,
                                  size: 32,
                                ),
                                gap(w: 5),
                                Text(
                                  reviews.length > 0
                                      ? double.parse(
                                              ((totalReviews / reviews.length))
                                                  .toStringAsFixed(1))
                                          .toString()
                                      : '0',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '/5.0',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: blackLight,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              '${reviews.length} Reviews',
                              style: TextStyle(
                                color: blackLight,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    gap(h: 10),
                    SingleChildScrollView(
                      child: Column(
                        children: reviewWidgets,
                      ),
                    )
                  ],
                ),
              );
  }
}
