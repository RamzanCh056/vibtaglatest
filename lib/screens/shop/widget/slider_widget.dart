// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constant.dart';

class ShopSliderItem extends StatefulWidget {
  final Map<String, dynamic> item;
  const ShopSliderItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<ShopSliderItem> createState() => _ShopSliderItemState();
}

class _ShopSliderItemState extends State<ShopSliderItem> {
  @override
  Widget build(BuildContext context) {
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    return Stack(
      children: [
        Container(
            width: width,
            height: width * 1.3,
            child: Image.network(
              widget.item['image'].toString().trim(),
              fit: BoxFit.fill,
            )),
        widget.item['button_title'] == ''
            ? gap()
            : Positioned(
                top: 30,
                right: 20,
                child: InkWell(
                  onTap: () {
                    launchUrl(
                      Uri.parse(
                        widget.item['link'].toString().trim(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: spacing(
                      horizontal: width * 0.03,
                      vertical: 5,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(
                      widget.item['button_title'],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
      ],
    );
  }
}
