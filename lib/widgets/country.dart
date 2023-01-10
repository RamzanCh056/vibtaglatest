import 'package:flutter/material.dart';

import '../utils/constant.dart';

class SelectCountry extends StatefulWidget {
  final List<String> items;
  final String title;
  final double fieldHeight;
  final double fontSize;
  final TextEditingController controller;
  const SelectCountry({
    Key? key,
    required this.title,
    required this.items,
    required this.controller,
    this.fieldHeight = 0.05,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  String dropdownValue = 'Select';

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      width: width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.005,
            ),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            width: width * 0.8,
            height: height * widget.fieldHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(width * 0.04),
              border: Border.all(
                width: width * 0.005,
                color: Color.fromARGB(255, 109, 104, 104),
              ),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              hint: const Padding(
                padding: EdgeInsets.only(
                  left: 15.0,
                  right: 5.0,
                ),
                child: Text('Select Correct'),
              ),
              elevation: 16,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              underline: Container(
                height: 1,
                color: Color.fromARGB(0, 124, 77, 255),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  widget.controller.text = newValue;
                });
              },
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 5),
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: widget.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
