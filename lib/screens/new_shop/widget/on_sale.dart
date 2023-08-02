import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/new_shop/widget/product_widget.dart';
import 'package:vibetag/utils/constant.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: HexColor('#F1F4FB'), borderRadius: borderRadius(7)),
      padding: spacing(horizontal: 10, vertical: 25),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ProductWidget(),
          ProductWidget(),
          Container(
            width: double.infinity,
            margin: spaceOnly(top: 15),
            alignment: Alignment.center,
            child: Center(
              child: Container(
                padding: spacing(vertical: 10,horizontal: 25),
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(
                    color: orange,
                    width: 2,
                  ),
                  borderRadius: borderRadius(10),
                ),
                child: Text(
                  'Load More',
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
            ),
          ),
        ],
      ),
    );
  }
}
