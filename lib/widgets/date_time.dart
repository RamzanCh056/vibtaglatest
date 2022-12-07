import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../utils/constant.dart';

class DateTimePicterField extends StatefulWidget {
  const DateTimePicterField({super.key});

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
        horizontal: width * 0.06,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'BirthDay',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            width: width * 0.8,
            height: height * 0.04,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            decoration: BoxDecoration(
              border: Border.all(
                width: width * 0.005,
                color: Color.fromARGB(255, 109, 104, 104),
              ),
              borderRadius: BorderRadius.circular(
                width * 0.1,
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
                  : const Text(
                      'Select',
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
