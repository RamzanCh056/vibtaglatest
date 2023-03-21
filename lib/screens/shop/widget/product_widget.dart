// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/constant.dart';

class ShopProductWidget extends StatelessWidget {
  final Map<String, dynamic> product;
  bool haveSale = false;
  ShopProductWidget({
    Key? key,
    required this.product,
    this.haveSale = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: spacing(
        horizontal: width * 0.01,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        color: HexColor('#FFFFFF'),
        borderRadius: borderRadius(10),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius(10),
              ),
              width: width * 0.4,
              height: height * 0.3,
              child: ClipRRect(
                borderRadius: radiusOnly(
                  topLeft: 10,
                  topRight: 10,
                ),
                child: Image.network(
                  product['images'][0]['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          haveSale
              ? Positioned(
                  top: width * 0.03,
                  right: width * 0.02,
                  child: Container(
                    width: width * 0.1,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: borderRadius(5),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Sale',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    ),
                  ),
                )
              : gap(),
          Positioned(
            top: width * 0.03,
            left: 10,
            child: Container(
              height: 25,
              padding: spacing(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: blackPrimary,
                borderRadius: borderRadius(5),
              ),
              alignment: Alignment.center,
              child: Text(
                product['product_sub_category'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                maxLines: 1,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: height * 0.09,
              decoration: BoxDecoration(
                color: HexColor('#F0F0F0'),
                borderRadius: borderRadius(5),
              ),
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            bottom: height * 0.04,
            left: 5,
            child: Container(
              height: height * 0.05,
              width: width * 0.35,
              alignment: Alignment.center,
              child: Text(
                product['name'],
                style: TextStyle(
                  fontSize: 10,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 5,
            child: Container(
              height: height * 0.05,
              width: width * 0.35,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  product['brand'] == ''
                      ? gap()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: spacing(
                                horizontal: width * 0.01,
                                vertical: height * 0.001,
                              ),
                              decoration: BoxDecoration(
                                color: HexColor('#000000'),
                                borderRadius: borderRadius(10),
                              ),
                              child: Text(
                                product['brand'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            Container(
                              padding: spacing(
                                horizontal: width * 0.01,
                                vertical: height * 0.001,
                              ),
                              decoration: BoxDecoration(
                                color: HexColor('#000000'),
                                borderRadius: borderRadius(10),
                              ),
                              child: Text(
                                product['brand'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                              ),
                            ),
                          ],
                        ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: Text(
                          '\$${product['price']}',
                          style: TextStyle(
                            color: HexColor('#A0A0A0'),
                            fontSize: 8,
                            decoration: haveSale
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.002,
                      ),
                      haveSale
                          ? Container(
                              child: Text(
                                '\$${product['sale_price']}',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 8,
                                ),
                              ),
                            )
                          : gap(),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
