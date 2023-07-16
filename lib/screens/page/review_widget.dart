// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:vibetag/utils/constant.dart';

class ReviewWiget extends StatelessWidget {
  Map<String, dynamic> review;
  ReviewWiget({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: spacing(
        horizontal: 7,
      ),
      padding: spacing(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: borderRadius(7),
        color: white,
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.1,
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(review['user_data']['avatar']),
                  radius: height * 0.045,
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      review['user_data']['name'],
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    gap(w: 10),
                    Icon(
                      Icons.star,
                      color: orangePrimary,
                      size: 20,
                    ),
                    gap(w: 5),
                    Text(
                      '${review['valuation']}.0',
                      style: TextStyle(
                        color: blackLight,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.05,
                      height: width * 0.05,
                      child: Image.asset('assets/images/flag.png'),
                    ),
                    gap(w: 5),
                    Container(
                      width: width * 0.45,
                      height: width * 0.05,
                      child: Text(
                        countries['${review['user_data']['country_id']}'],
                        style: TextStyle(
                          fontSize: 12,
                          color: blackLight,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              child: Text(
                '                     ${review['review']}',
                style: TextStyle(
                  overflow: TextOverflow.clip,
                  fontSize: 12,
                  color: blackLight,
                ),
              ),
            ),
            gap(h: 15),
          ],
        ),
      ),
    );
  }
}
