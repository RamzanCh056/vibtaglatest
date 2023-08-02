// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:vibetag/screens/blog/blog_details_screen.dart';
import 'package:vibetag/screens/profile/profile.dart';
import 'package:vibetag/utils/constant.dart';

import '../register/reusabletext.dart';

class BlogWidget extends StatefulWidget {
  Map<String, dynamic> blog;
  BlogWidget({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  State<BlogWidget> createState() => _BlogWidgetState();
}

class _BlogWidgetState extends State<BlogWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushRoute(
          context: context,
          screen: BlogDetailScreen(blog: widget.blog),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffFFFFFF),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: radiusOnly(topLeft: 10, topRight: 10),
                child: Image(
                  width: MediaQuery.of(context).size.width * 1,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.blog['thumbnail'],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xffFF9200).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: ReusableText(
                              title: setName(widget.blog['tags'], length: 25),
                              size: 16,
                              weight: FontWeight.w600,
                              color: Color(0xffFF9200),
                            ),
                          ),
                        ),
                        Spacer(),
                        ReusableText(
                          title: readTimestamp(
                              int.parse(widget.blog['posted'].toString())),
                          size: 12,
                          weight: FontWeight.w500,
                          color: Color(0xff7D8CAC),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlogDetailScreen(
                                        blog: {},
                                      )));
                        });
                      },
                      child: ReusableText(
                        title: widget.blog['title'],
                        size: 16,
                        weight: FontWeight.w700,
                        color: Color(0xff212121),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                      height: 2,
                      color: Color(0xffF1F4FB),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        pushRoute(
                          context: context,
                          screen: Profile(
                            user_id:
                                widget.blog['author']['user_id'].toString(),
                          ),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: borderRadius(width),
                              child: Image(
                                image: NetworkImage(
                                  widget.blog['author']['avatar'],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ReusableText(
                            title: widget.blog['author']['name'],
                            size: 13,
                            weight: FontWeight.w700,
                            color: Color(0xff212121),
                          ),
                          Spacer(),
                          Icon(
                            Icons.more_horiz,
                            color: Color(0xffC8D1E5),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              SizedBox(
                      height: 15,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
