// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../utils/constant.dart';

class ReactedUserWidget extends StatelessWidget {
  final Map<String, dynamic> user;
  const ReactedUserWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: spacing(horizontal: 10, vertical: 5),
      margin: spacing(vertical: 5),
      decoration: BoxDecoration(
        color: white,
        boxShadow: lightShadow,
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                padding: spacing(
                  horizontal: 0.025,
                  vertical: 0.025,
                ),
                decoration: BoxDecoration(
                  color: blue,
                  border: Border.all(
                    width: 2,
                    color: white,
                  ),
                  borderRadius: borderRadius(
                    width,
                  ),
                ),
                width: width * 0.12,
                child: ClipRRect(
                  borderRadius: borderRadius(width),
                  child: netImage(
                    user['publisher']['avatar'],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 20,
                  child: Image.asset(
                    reactions[(int.parse(user['reaction'].toString()) - 1)],
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
          gap(w: 7),
          Container(
            width: width * 0.75,
            child: Text(
              user['publisher']['name'],
              style: TextStyle(
                color: blackPrimary,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
