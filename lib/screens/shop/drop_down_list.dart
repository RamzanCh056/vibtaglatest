import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/constant.dart';

class DropDownList extends StatefulWidget {
  final List<String> items;
  String first;
  final TextEditingController controller;
  Color bgColor = Colors.black;
  Color textColor = Colors.black;
  double fontSize;
  double padding;
  bool isUnderline;

  DropDownList({
    Key? key,
    required this.items,
    required this.controller,
    required this.first,
    this.bgColor = Colors.black,
    this.textColor = Colors.black,
    this.padding = 0,
    this.fontSize = 18,
    this.isUnderline = false,
  }) : super(key: key);

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
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
            iconEnabledColor: widget.textColor,
            icon: Icon(
              Icons.keyboard_arrow_down_outlined,
              size: widget.fontSize + 12,
            ),
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
              color: widget.textColor,
              fontSize: widget.fontSize,
            ),
            underline: widget.isUnderline
                ? Container()
                : Container(
                    height: 1,
                    color: widget.textColor,
                  ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                widget.first = newValue;
                widget.controller.text = newValue;
              });
            },
            items: widget.items.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    width: double.maxFinite,
                    color: widget.bgColor,
                    padding: EdgeInsets.only(
                      left: 0.0,
                      right: 0,
                      top: widget.padding,
                      bottom: widget.padding,
                    ),
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
