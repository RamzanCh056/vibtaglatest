// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/provider/userProvider.dart';

import '../../../utils/constant.dart';

class TrendActivitiesWidget extends StatelessWidget {
  final Map<String, dynamic> activity;

  const TrendActivitiesWidget({
    Key? key,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: spacing(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: grayMed,
          ),
        ),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: width * 0.08,
                foregroundImage: NetworkImage(activity['activator']['avatar']),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 25,
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(
                      width: 2,
                      color: white,
                    ),
                    borderRadius: borderRadius(25),
                  ),
                  child: Image.asset(
                    'assets/icons/Bitmap.png',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          gap(w: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              activity['activity_type'] == 'following'
                  ? Row(
                      children: [
                        Text(
                          'You started following ',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          activity['activator']['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  : gap(),
              gap(h: 7),
              Text(
                '${readTimestamp(int.parse(activity['time'].toString()))} ago',
                style: TextStyle(
                  fontSize: 12,
                  color: grayMed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
