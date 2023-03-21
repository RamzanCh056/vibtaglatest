// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../utils/constant.dart';

class TrendProductWidget extends StatelessWidget {
  final Map<String, dynamic> product;
  const TrendProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: spacing(
        vertical: 5,
      ),
      child: Container(
        margin: spacing(
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          boxShadow: lightShadow,
          color: white,
          borderRadius: borderRadius(12),
        ),
        child: ClipRRect(
          borderRadius: borderRadius(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: height * 0.25,
                width: width * 0.7,
                child: Image.network(
                  product['images'][0]['image']
                      .toString()
                      .trim(),
                  fit: BoxFit.cover,
                  width: width * 0.08,
                ),
              ),
              Container(
                width: width * 0.7,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    gap(h: 10),
                    Container(
                      margin: spacing(horizontal: 7),
                      width: width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.5,
                            child: Text(
                              product['name'],
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                          gap(w: 5),
                          Text(
                            '£${product['price_max']}',
                            style: TextStyle(
                              color: orangePrimary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    gap(h: 10),
                    Container(
                      width: width * 0.7,
                      margin: spacing(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: spacing(horizontal: 15, vertical: 7),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: grayMed,
                              ),
                              borderRadius: borderRadius(5),
                            ),
                            child: Text(
                              'Contact now',
                              style: TextStyle(
                                color: grayMed,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Container(
                            padding: spacing(horizontal: 15, vertical: 7),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: grayMed,
                              ),
                              borderRadius: borderRadius(5),
                            ),
                            child: Text(
                              'View more',
                              style: TextStyle(
                                color: grayMed,
                                fontSize: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    gap(h: 15),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
