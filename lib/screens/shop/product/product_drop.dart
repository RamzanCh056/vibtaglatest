import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class ProductDropDownWidget extends StatefulWidget {
  final String dropText;
  final Widget widget;
  const ProductDropDownWidget({
    super.key,
    required this.dropText,
    required this.widget,
  });

  @override
  State<ProductDropDownWidget> createState() => _ProductDropDownWidgetState();
}

class _ProductDropDownWidgetState extends State<ProductDropDownWidget> {
  bool isTap = false;
  TextEditingController delivery = TextEditingController();
  final List<String> buttonText = [
    '1 like',
    '85 Products',
    '10 Recations',
    '5 Shop Review'
  ];
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      padding: spacing(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: borderRadius(15),
      ),
      width: width * 0.95,
      child: Column(
        children: [
          Container(
            padding: spacing(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: white,
              borderRadius: borderRadius(15),
            ),
            width: width * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isTap = !isTap;
                    });
                  },
                  child: Text(
                    '${widget.dropText}',
                    style: TextStyle(
                      color: darkGray,
                      fontSize: textMed,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isTap = !isTap;
                    });
                  },
                  child: Icon(
                    isTap
                        ? Icons.keyboard_arrow_up_outlined
                        : Icons.keyboard_arrow_down_outlined,
                    color: darkGray,
                    size: iconMax,
                  ),
                )
              ],
            ),
          ),
          isTap
              ? Container(
                  width: width * 0.95,
                  height: 1,
                  color: accent,
                )
              : Container(),
          isTap ? widget.widget : Container(),
        ],
      ),
    );
  }
}
