import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/constant.dart';

Widget ShopTab({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return Container(
    width: width,
    height: height * 0.7,
    color: backgroundColor,
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.85,
      ),
      itemCount: 12,
      itemBuilder: (BuildContext context, int i) {
        return Container(
          color: white,
          margin: spacing(
            horizontal: 5,
            vertical: 5,
          ),
          child: ClipRRect(
            borderRadius: borderRadius(7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    color: HexColor('#421404'),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(7),
                    ),
                  ),
                ),
                Container(
                  margin: spacing(
                    vertical: 10,
                  ),
                  padding: spacing(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(7),
                      bottomRight: Radius.circular(7),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: width * 0.45,
                        child: const Text(
                          'Nike Shoes',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.45,
                        child: Text(
                          '\$299.99',
                          style: TextStyle(
                            color: orange,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: spacing(
                            horizontal: 5,
                            vertical: 5,
                          ),
                          margin: spacing(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: orangePrimary,
                            borderRadius: borderRadius(5),
                          ),
                          width: width * 0.45,
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: white,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
