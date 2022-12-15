import 'package:flutter/material.dart';

import '../utils/constant.dart';

class MediaLibrary extends StatefulWidget {
  final List<String> items;
  final TextEditingController controller;
  const MediaLibrary({
    Key? key,
    required this.items,
    required this.controller,
  }) : super(key: key);

  @override
  State<MediaLibrary> createState() => _MediaLibraryState();
}

class _MediaLibraryState extends State<MediaLibrary> {
  String dropdownValue = 'Media/Attachments';

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: width * 0.9,
          decoration: BoxDecoration(
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
