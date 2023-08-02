// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class EditPage extends StatefulWidget {
  final Map<String, dynamic> page;
  const EditPage({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    return Container(
      height: height * 0.95,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: white,
        boxShadow: boxShadow,
        borderRadius: borderRadius(15),
      ),
      child: Column(
        children: [
          gap(h: 15),
          Container(
            padding: spacing(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                gap(),
                Text(
                  'Edit Page',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset('assets/icons/clear_comment_1.png'),
                )
              ],
            ),
          ),
          gap(h: 15),
          Container(
            width: double.maxFinite,
            height: height * 0.35,
            child: Stack(
              children: [
                Container(
                  height: height * 0.2,
                  child: Image.network(
                    widget.page['cover'],
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                  ),
                ),
                Positioned(
                  top: height * 0.125,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Container(
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: white,
                        ),
                        borderRadius: borderRadius(width),
                      ),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: width * 0.15,
                            foregroundImage: NetworkImage(
                              widget.page['avatar'],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 10,
                            child: Image.asset(
                                'assets/new/icons/take_a_photo.png'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.29,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Text(
                        widget.page['page_title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      gap(h: 5),
                      Text(
                        widget.page['category'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: grayMed,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: spacing(horizontal: 15),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gap(h: 5),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: widget.page['page_title'],
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: grayMed,
                        ),
                        borderRadius: borderRadius(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
