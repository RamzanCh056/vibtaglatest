import 'package:date_time_picker/date_time_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/screens/home/create_post/audience_option.dart';
import 'package:vibetag/screens/home/create_post/category_option.dart';
import 'package:vibetag/utils/constant.dart';

class CreatePoll extends StatefulWidget {
  const CreatePoll({super.key});

  @override
  State<CreatePoll> createState() => _CreatePollState();
}

class _CreatePollState extends State<CreatePoll> {
  bool isSwitch = true;
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.9,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: spacing(
                horizontal: 25,
              ),
              child: Container(
                padding: spacing(
                  vertical: 20,
                ),
                child: Text(
                  'Create Poll',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Container(
              height: 2,
              width: double.maxFinite,
              color: grayMed,
            ),
            gap(h: 15),
            Column(
              children: [
                Container(
                  margin: spacing(
                    horizontal: 15,
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Question',
                          style: TextStyle(
                            color: blackPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      gap(h: 7),
                      Container(
                        height: height * 0.05,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Write your question',
                            hintStyle: TextStyle(
                              color: grayMed,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: grayMed,
                              ),
                              borderRadius: borderRadius(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                gap(h: 30),
                Container(
                  height: 10,
                  width: double.maxFinite,
                  color: grayLight,
                ),
                gap(h: 30),
                Container(
                  margin: spacing(
                    horizontal: 15,
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Expiration',
                          style: TextStyle(
                            color: blackPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      gap(h: 7),
                      DateTimePicker(
                        type: DateTimePickerType.dateTimeSeparate,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event),
                        dateLabelText: 'Date',
                        timeLabelText: "Hour",
                        selectableDayPredicate: (date) {
                          if (date.weekday == 6 || date.weekday == 7) {
                            return false;
                          }
                          return true;
                        },
                        style: TextStyle(
                          color: grayMed,
                        ),
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                      gap(h: 30),
                      Container(
                        height: 10,
                        width: double.maxFinite,
                        color: grayLight,
                      ),
                      gap(h: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Option'),
                          Text(
                            '+ Add Option',
                            style: TextStyle(
                              color: orange,
                            ),
                          ),
                        ],
                      ),
                      gap(h: 7),
                      Container(
                        height: height * 0.05,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Write Option 1',
                            hintStyle: TextStyle(
                              color: grayMed,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: grayMed,
                              ),
                              borderRadius: borderRadius(10),
                            ),
                          ),
                        ),
                      ),
                      gap(h: 12),
                      Container(
                        height: height * 0.05,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Write Option 1',
                            hintStyle: TextStyle(
                              color: grayMed,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: grayMed,
                              ),
                              borderRadius: borderRadius(10),
                            ),
                          ),
                        ),
                      ),
                      gap(h: 30),
                      Container(
                        height: 10,
                        width: double.maxFinite,
                        color: grayLight,
                      ),
                      gap(h: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Allow selecting mulitple option'),
                          Switch(
                            value: isSwitch,
                            onChanged: (value) {
                              setState(() {
                                isSwitch = value;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            gap(h: 30),
            Container(
              margin: spacing(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.35,
                    padding: spacing(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: borderRadius(10),
                      color: grayLight,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: grayMed,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  gap(w: 10),
                  Container(
                    width: width * 0.35,
                    padding: spacing(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: borderRadius(10),
                      gradient: gradient,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
