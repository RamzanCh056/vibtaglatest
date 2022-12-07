import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/constant.dart';

class ShopCategoryItems extends StatefulWidget {
  final List<String> items;
  final String first;
  final TextEditingController controller;
  String bgColor = '#000000';
  String textColor = '#000000';
  ShopCategoryItems({
    Key? key,
    required this.items,
    required this.controller,
    required this.first,
    this.bgColor = '#000000',
    this.textColor = '#ffffff',
  }) : super(key: key);

  @override
  State<ShopCategoryItems> createState() => _ShopCategoryItemsState();
}

class _ShopCategoryItemsState extends State<ShopCategoryItems> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = '${widget.first}';
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.04),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            focusColor: Colors.black,
            hint: const Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 5.0,
              ),
              child: Text('Select Correct'),
            ),
            elevation: 16,
            style: TextStyle(
              color: HexColor('${widget.textColor}'),
              fontSize: 18,
            ),
            underline: Container(
              height: 1,
              color: Colors.white,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                widget.controller.text = newValue;
              });
            },
            items: widget.items.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    width: double.maxFinite,
                    color: HexColor('${widget.bgColor}'),
                    padding: const EdgeInsets.only(left: 15.0, right: 10),
                    child: Text(value),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
