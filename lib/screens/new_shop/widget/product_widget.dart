import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width*0.45,
      margin: spacing(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: white,
        boxShadow: lightShadow,
        borderRadius: borderRadius(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: radiusOnly(topLeft: 7, topRight: 7),
            child: Container(
              width: width*0.45,
              height: width*0.45,
              child: Image.asset(
                'assets/shop/product.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          gap(h: 2),
          Container(
            margin: spacing(horizontal: 5),
            child: Text(
              'Air Max Best Sound Quality Active...',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: blackPrimary,
                fontFamily: 'Manrope',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          gap(h: 2),
          Row(
            children: [
              Container(
                width: 170,
                height: 14,
                margin: spacing(horizontal: 5),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, i) {
                      if (i == 5) {
                        return Container(
                          margin: spacing(horizontal: 5),
                          child: Text(
                            '(33)',
                            style: TextStyle(
                              color: orange,
                              fontFamily: 'Manrope',
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }
                      return Icon(
                        Icons.star,
                        color: orange,
                        size: 14,
                      );
                    }),
              ),
            ],
          ),
          gap(h: 2),
          Container(
            margin: spacing(horizontal: 5),
            child: Text(
              '\$ 249.99',
              maxLines: 2,
              style: TextStyle(
                color: orange,
                fontFamily: 'Manrope',
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          gap(h: 2),
          Container(
            margin: spacing(horizontal: 5),
            child: Text(
              '\$ 2.00 -53%',
              maxLines: 1,
              style: TextStyle(
                color: grayMed,
                fontFamily: 'Manrope',
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          gap(h: 10),
        ],
      ),
    );
  }
}
