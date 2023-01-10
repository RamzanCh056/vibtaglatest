import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../utils/constant.dart';

Widget ReviewTab({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    const Text(
                      '4.9',
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
                  '33 Reviews',
                  style: TextStyle(
                    color: blackLight,
                  ),
                )
              ],
            ),
          ),
        ),
        gap(h: 10),
        Container(
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
                      backgroundImage:
                          const AssetImage('assets/new/images/user.png'),
                      radius: height * 0.045,
                    ),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Mark Henry',
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
                          '5.0',
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
                        gap(w: 10),
                        Container(
                          width: width * 0.45,
                          height: width * 0.05,
                          child: Text(
                            'Pakistan',
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
                    'Good quality options and finishes, builder worked with me to make a design I really liked.',
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
        ),
        gap(h: 10),
        Container(
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
                      backgroundImage:
                          const AssetImage('assets/new/images/user.png'),
                      radius: height * 0.045,
                    ),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Mark Henry'),
                        gap(w: 10),
                        Icon(
                          Icons.star,
                          color: orangePrimary,
                          size: 20,
                        ),
                        Text(
                          '5.0',
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
                        gap(w: 10),
                        Container(
                          width: width * 0.45,
                          height: width * 0.05,
                          child: Text(
                            'Pakistan',
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
                    'Good quality options and finishes, builder worked with me to make a design I really liked. Good quality options and finishes, builder worked with me to make a design I really liked.',
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
        ),
      ],
    ),
  );
}
