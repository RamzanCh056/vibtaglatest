// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/constant.dart';

class HashTrendWidget extends StatelessWidget {
  Map<String, dynamic> hash;
  HashTrendWidget({
    Key? key,
    required this.hash,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: spacing(
          horizontal: 5,
          vertical: 7,
        ),
        padding: spacing(
          horizontal: 5,
          vertical: 7,
        ),
        decoration: BoxDecoration(
          color: white,
          borderRadius: borderRadius(5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: spacing(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: HexColor('#FFF7ED'),
                borderRadius: borderRadius(5),
              ),
              child: Icon(
                Icons.trending_up,
                color: blackPrimary,
                size: 24,
              ),
            ),
            gap(w: 5),
            Container(
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '#${hash['tag']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: orangePrimary,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Manrope',
                    ),
                  ),
                  Container(
                    child: Text(
                      '${getInK(number: int.parse(hash['total_hashtag_posts'].toString()))} posts',
                      style: TextStyle(
                        fontSize: 12,
                        color: lightblue,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  )
                ],
              ),
            ),
            gap(w: 5),
          ],
        ),
      ),
    );
  }
}
