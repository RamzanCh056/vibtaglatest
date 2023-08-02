import 'package:flutter/material.dart';
import 'package:vibetag/screens/blog/blog_widget.dart';
import 'package:vibetag/screens/blog/reusable_listtile.dart';
import '../register/reusabletext.dart';

class EntertainmentClick extends StatefulWidget {
  const EntertainmentClick({Key? key}) : super(key: key);

  @override
  State<EntertainmentClick> createState() => _EntertainmentClickState();
}

class _EntertainmentClickState extends State<EntertainmentClick> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlogWidget(blog: {}),
        SizedBox(
          height: 10,
        ),
        BlogWidget(blog: {}),
        SizedBox(
          height: 10,
        ),
        BlogWidget(blog: {}),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            height: 52,
            width: 127,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffFDBA31)),
              borderRadius: BorderRadius.circular(26),
              color: Color(0xffFFFFFF),
            ),
            child: Center(
              child: ReusableText(
                title: 'See More',
                size: 16,
                weight: FontWeight.w700,
                color: Color(0xffFF9200),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffFFFFFF),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ReusableText(
                    title: 'Popular Articles',
                    size: 20,
                    weight: FontWeight.w700,
                    color: Color(0xff212121),
                  ),
                  Spacer(),
                  ReusableText(
                    title: 'See all',
                    size: 12,
                    weight: FontWeight.w500,
                    color: Color(0xffFF9200),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
                height: 2,
                color: Color(0xffC8D1E5),
              ),
              SizedBox(
                height: 10,
              ),
              ReusableListTile(),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
                height: 2,
                color: Color(0xffC8D1E5),
              ),
              ReusableListTile(),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
                height: 2,
                color: Color(0xffC8D1E5),
              ),
              ReusableListTile(),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffFFFFFF),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ReusableText(
                    title: 'Recent Articles',
                    size: 20,
                    weight: FontWeight.w700,
                    color: Color(0xff212121),
                  ),
                  Spacer(),
                  ReusableText(
                    title: 'See all',
                    size: 12,
                    weight: FontWeight.w500,
                    color: Color(0xffFF9200),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
                height: 2,
                color: Color(0xffC8D1E5),
              ),
              SizedBox(
                height: 10,
              ),
              ReusableListTile(),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
                height: 2,
                color: Color(0xffC8D1E5),
              ),
              ReusableListTile(),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
                height: 2,
                color: Color(0xffC8D1E5),
              ),
              ReusableListTile(),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
