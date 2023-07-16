// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:vibetag/screens/home/post_types/post_file.dart';
import 'package:vibetag/utils/constant.dart';

class FindVibesWidget extends StatefulWidget {
  Map<String, dynamic> post;
  FindVibesWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<FindVibesWidget> createState() => _FindVibesWidgetState();
}

class _FindVibesWidgetState extends State<FindVibesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6)
              ]),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: spacing(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.12,
                      height: width * 0.12,
                      padding: EdgeInsets.all(
                        width * 0.01,
                      ),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/new/images/border.png',
                          ),
                        ),
                      ),
                      child: CircleAvatar(
                        radius: width * 0.055,
                        foregroundImage:
                            NetworkImage(widget.post['publisher']['avatar']),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.post['publisher']['name'],
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          widget.post['post_time'],
                          style:
                              TextStyle(fontSize: 10, color: Color(0xff7D8CAC)),
                        )
                      ],
                    ),
                    const Expanded(child: Text("")),
                    const Icon(
                      Icons.more_horiz,
                      color: Color(0xff99A7C7),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              postFile(
                file: widget.post['postFile'],
                thumbnail: widget.post['postFileThumb'],
                post_id: widget.post['id'],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: spacing(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Color(0xff99A7C7),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                                getInK(
                                    number: int.parse(widget.post['reaction']
                                            ['count']
                                        .toString())),
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff99A7C7)))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 45,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.message,
                              color: Color(0xff99A7C7),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                                getInK(
                                    number: int.parse(widget
                                        .post['total_comments']
                                        .toString())),
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff99A7C7)))
                          ],
                        ),
                      ),
                    ),
                    const Expanded(child: Text("")),
                    Container(
                        height: 45,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Center(
                          child: Icon(Icons.share, color: Color(0xff99A7C7)),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
