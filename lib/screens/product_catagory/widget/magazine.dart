import 'package:flutter/material.dart';
class Magazine extends StatelessWidget {
  final String? title1;
  final String? title2;
  final String? subtitle;

  const Magazine({this.title1, this.title2, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 230,
      width: MediaQuery.of(context).size.width/2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width/2,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
          ),
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width/2,
            decoration: BoxDecoration(
              color: Color(0xFFEAEAEA),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                          title1!,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        )),
                    SizedBox(
                      height: 10,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                    ),
                    Expanded(
                        child: Text(
                          title2!,
                          style: TextStyle(fontSize: 10, color: Color(0xFFFF9200)),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  subtitle!,
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}