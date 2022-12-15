import 'package:flutter/material.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../utils/constant.dart';

class DateTimePicterField extends StatefulWidget {
  String title;
  String hintText;
  double borderRadius;
  bool allowborder;
  double fontSize;
  Color color;
  double padding;

  DateTimePicterField({
    super.key,
    this.title = 'Birthday',
    this.borderRadius = 300,
    this.hintText = 'Select',
    this.allowborder = true,
    this.fontSize = 14,
    this.color = Colors.white,
    this.padding = 10,
  });

  @override
  State<DateTimePicterField> createState() => _DateTimePicterFieldState();
}

class _DateTimePicterFieldState extends State<DateTimePicterField> {
  String formatedDate = '';
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      width: width * 0.9,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.002,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: widget.fontSize,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            width: width,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: widget.padding,
            ),
            decoration: BoxDecoration(
              color: widget.color,
              border: widget.allowborder
                  ? Border.all(
                      width: width * 0.005,
                      color: Color.fromARGB(255, 109, 104, 104),
                    )
                  : Border.all(
                      width: 0,
                      color: Color.fromARGB(0, 255, 255, 255),
                    ),
              borderRadius: BorderRadius.circular(
                widget.borderRadius,
              ),
            ),
            child: InkWell(
              onTap: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(1995, 3, 5),
                    maxTime: DateTime.now(),
                    theme: const DatePickerTheme(
                        headerColor: Colors.orange,
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        itemStyle: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        doneStyle: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16)), onChanged: (date) {
                  print(
                    'change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString(),
                  );
                }, onConfirm: (date) {
                  print('confirm $date');
                  setState(() {
                    formatedDate = DateFormat.yMMMd().format(date);
                    isSelected = true;
                  });
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
              child: isSelected
                  ? Text(
                      formatedDate.toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 104, 103, 103),
                      ),
                    )
                  : Text(
                      widget.hintText,
                      style: TextStyle(
                        color: Color.fromARGB(255, 104, 103, 103),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
