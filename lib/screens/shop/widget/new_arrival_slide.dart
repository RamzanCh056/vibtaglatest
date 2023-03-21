// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../utils/constant.dart';

class NewArrivalsWidget extends StatelessWidget {
  Map<String, dynamic> arrival;
  NewArrivalsWidget({
    Key? key,
    required this.arrival,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      margin: spacing(
        horizontal: 20,
        vertical: 20,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: boxShadow,
              borderRadius: borderRadius(10),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: width * 0.55,
                    height: width * 0.45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        arrival['images'][0]['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  gap(h: 10),
                  Container(
                    width: width * 0.55,
                    padding: spacing(
                      horizontal: 7,
                    ),
                    child: Text(
                      arrival['name'],
                      style: TextStyle(
                        color: blackPrimary,
                        fontSize: 12,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  gap(h: 7),
                  Text(
                    arrival['seller']['currency_symbol'] != null
                        ? '${arrival['seller']['currency_symbol']} ${arrival['price']}'
                        : '\$ ${arrival['price']}',
                    style: TextStyle(
                      color: grayMed,
                      fontSize: 10,
                    ),
                  ),
                  arrival['sale_price'].toString() != '0'
                      ? Column(
                          children: [
                            Text(
                              arrival['seller']['currency_symbol'] != null
                                  ? '${arrival['seller']['currency_symbol']} ${arrival['price']}'
                                  : '\$ ${arrival['price']}',
                              style: TextStyle(
                                color: grayMed,
                                fontSize: 10,
                              ),
                            ),
                            gap(h: 7),
                          ],
                        )
                      : gap(),
                  gap(h: 10),
                ],
              ),
            ),
          ),
          Positioned(
            top: 7,
            left: 5,
            child: Container(
              padding: spacing(
                horizontal: 15,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: blackPrimary,
                borderRadius: borderRadius(5),
              ),
              child: Text(
                arrival['product_sub_category'],
                style: TextStyle(
                  color: white,
                  fontSize: 8,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
