import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/utils/constant.dart';

class TitleAndCover extends StatefulWidget {
  const TitleAndCover({super.key});

  @override
  State<TitleAndCover> createState() => _TitleAndCoverState();
}

class _TitleAndCoverState extends State<TitleAndCover> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.9,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: spacing(
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/new/icons/livestream/icons_left.png'),
                Container(
                  padding: spacing(
                    vertical: 20,
                  ),
                  child: Text(
                    'Title and Cover',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                gap(),
              ],
            ),
          ),
          Container(
            height: 2,
            width: double.maxFinite,
            color: grayMed,
          ),
          gap(h: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: spacing(
                  horizontal: 15,
                ),
                child: Text(
                  'Title',
                  style: TextStyle(
                    color: blackPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap(h: 5),
              Container(
                margin: spacing(
                  horizontal: 15,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter here',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: grayMed,
                      ),
                      borderRadius: borderRadius(10),
                    ),
                    contentPadding: EdgeInsets.only(
                      bottom: 0,
                      left: 15,
                    ),
                    hintStyle: TextStyle(
                      color: grayMed,
                    ),
                  ),
                  style: TextStyle(
                    color: grayMed,
                  ),
                ),
              )
            ],
          ),
          gap(h: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: spacing(
                  horizontal: 15,
                ),
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: blackPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap(h: 5),
              Container(
                margin: spacing(
                  horizontal: 15,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter here',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: grayMed,
                      ),
                      borderRadius: borderRadius(10),
                    ),
                    contentPadding: EdgeInsets.only(
                      bottom: 0,
                      left: 15,
                      top: 30,
                    ),
                    hintStyle: TextStyle(
                      color: grayMed,
                    ),
                  ),
                  style: TextStyle(
                    color: grayMed,
                  ),
                  maxLines: 8,
                ),
              )
            ],
          ),
          gap(h: 30),
          Container(
            margin: spacing(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Thumbnail',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: blackPrimary,
                      ),
                    ),
                    Text(
                      'Recommended Ratio of 12:9.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: grayMed,
                      ),
                    ),
                  ],
                ),
                DottedBorder(
                  dashPattern: [12, 3],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  color: grayMed,
                  child: Container(
                    padding: spacing(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: grayLight,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 25,
                          child: Image.asset(
                            'assets/new/icons/take_a_photo.png',
                          ),
                        ),
                        gap(w: 5),
                        Text(
                          'Upload',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: grayMed,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          gap(h: 15),
          Container(
            margin: spacing(horizontal: 15),
            child: ClipRRect(
              borderRadius: borderRadius(10),
              child: Image.asset('assets/images/dum_thumbnail.png'),
            ),
          ),
          gap(h: 30),
          Container(
            margin: spacing(horizontal: 25),
            child: Container(
              width: double.maxFinite,
              padding: spacing(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: borderRadius(10),
                border: Border.all(
                  width: 2,
                  color: orange,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'Done',
                style: TextStyle(
                  color: orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
