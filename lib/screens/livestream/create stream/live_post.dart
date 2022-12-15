import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/livestream/create%20stream/live.dart';
import '../../../utils/constant.dart';

LivePost({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          iconPadding: EdgeInsets.only(
            top: height * 0.01,
            right: height * 0.01,
            left: width * 0.95,
          ),
          icon: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
                padding: EdgeInsets.all(
                  width * 0.01,
                ),
                decoration: BoxDecoration(
                    color: HexColor('#DDDDDD'),
                    borderRadius: BorderRadius.circular(
                      width * 0.3,
                    )),
                child: Icon(Icons.close)),
          ),
          content: Container(
            width: width * 0.95,
            height: height * 0.55,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: spacing(
                    horizontal: width * 0.07,
                    vertical: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          LivePopUp(context: context);
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_left,
                          size: 48,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.07,
                      ),
                      const Text(
                        'Post Title',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  width: width * 0.8,
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.05,
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              bottom: 0,
                              left: 10,
                            ),
                            hintText: 'Write Title...',
                            hintStyle: TextStyle(
                              fontSize: 16,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      DottedBorder(
                        color: Colors.orange,
                        borderType: BorderType.RRect,
                        strokeWidth: 3,
                        radius: Radius.circular(8),
                        dashPattern: [4, 4],
                        child: Card(
                          elevation: 0,
                          child: Container(
                            width: double.maxFinite,
                            height: height * 0.2,
                            child: const Center(
                              child: Text('Upload Thumbnail'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
