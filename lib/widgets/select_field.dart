import 'package:flutter/material.dart';

import '../utils/constant.dart';

class SelectField extends StatefulWidget {
  final List<String> items;
  final String title;
  final TextEditingController controller;
  const SelectField({
    Key? key,
    required this.title,
    required this.items,
    required this.controller,
  }) : super(key: key);

  @override
  State<SelectField> createState() => _SelectFieldState();
}

class _SelectFieldState extends State<SelectField> {
  String dropdownValue = 'Select';

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context : context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Container(
          width: width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(width * 0.04),
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
              color: const Color.fromARGB(0, 124, 77, 255),
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
                  child: Text(value),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
