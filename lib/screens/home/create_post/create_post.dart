import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/constant.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  List<Map<String, dynamic>> createPost = [
    {'name': 'Go Live', 'Icon': 'assets/icons/create_post_livestream.png'},
    {'name': 'Image', 'Icon': 'assets/icons/create_post_image.png'},
    {'name': 'Video', 'Icon': 'assets/icons/create_post_video.png'},
    {'name': 'Location', 'Icon': 'assets/icons/create_post_location.png'},
    {'name': 'Feelings', 'Icon': 'assets/icons/create_post_feelings.png'},
    {'name': 'Sell', 'Icon': 'assets/icons/create_post_sell.png'},
    {'name': 'Tag', 'Icon': 'assets/icons/create_post_tag.png'},
    {'name': 'Recording', 'Icon': 'assets/icons/create_post_recording.png'},
    {'name': 'Poll', 'Icon': 'assets/icons/create_post_poll.png'},
    {'name': 'Gif', 'Icon': 'assets/icons/create_post_gif.png'},
    {'name': 'File', 'Icon': 'assets/icons/create_post_file.png'},
    {'name': 'Audio', 'Icon': 'assets/icons/create_post_audio.png'},
  ];

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
      child: Column(
        children: [
          gap(h: 25),
          Container(
            width: width * 0.2,
            height: 5,
            decoration: BoxDecoration(
              color: grayMed,
              borderRadius: borderRadius(width),
            ),
          ),
          gap(h: 25),
          Container(
            margin: spacing(horizontal: 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: width * 0.075,
                  foregroundImage: AssetImage('assets/images/streamer.jpg'),
                ),
                gap(w: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Momin Hassan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    gap(h: 2),
                    Text(
                      'momin_9h11',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: grayMed,
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          gap(h: 15),
          Container(
            width: double.maxFinite,
            margin: spacing(horizontal: 15),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '🤙 What\'s your Vibe?',
                border: InputBorder.none,
              ),
              maxLines: 10,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: spacing(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: grayMed,
                    ),
                    borderRadius: borderRadius(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 10,
                        child: Image.asset(
                          'assets/icons/lock.png',
                        ),
                      ),
                      gap(w: 5),
                      Text(
                        'Public',
                        style: TextStyle(
                          color: grayPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      gap(w: 10),
                      Container(
                        width: 15,
                        child: Image.asset(
                          'assets/new/icons/livestream/arrow_down.png',
                        ),
                      )
                    ],
                  ),
                ),
                gap(w: 7),
                Container(
                  padding: spacing(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: grayMed,
                    ),
                    borderRadius: borderRadius(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(
                          color: grayPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      gap(w: 10),
                      Container(
                        width: 15,
                        child: Image.asset(
                          'assets/new/icons/livestream/arrow_down.png',
                        ),
                      )
                    ],
                  ),
                ),
                gap(w: 7),
                Container(
                  padding: spacing(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: grayMed,
                    ),
                    borderRadius: borderRadius(10),
                  ),
                  child: Container(
                    width: 15,
                    child: Image.asset(
                      'assets/svg/#.png',
                    ),
                  ),
                ),
                gap(w: 7),
                Container(
                  padding: spacing(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: grayMed,
                    ),
                    borderRadius: borderRadius(10),
                  ),
                  child: Container(
                    width: 15,
                    child: Image.asset(
                      'assets/new/icons/@.png',
                    ),
                  ),
                ),
                gap(w: 7),
                Container(
                  padding: spacing(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: grayMed,
                    ),
                    borderRadius: borderRadius(10),
                  ),
                  child: Container(
                    width: 15,
                    child: Image.asset(
                      'assets/images/emoji_face.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          gap(h: 15),
          Container(
            width: double.infinity,
            height: 10,
            color: grayLight,
          ),
          gap(h: 15),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: createPost.length,
            itemBuilder: (context, i) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      padding: spacing(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: HexColor('#FFF2E1'),
                        borderRadius: borderRadius(width),
                      ),
                      child: Image.asset(
                        createPost[i]['Icon'],
                      ),
                    ),
                    gap(h: 10),
                    Text(createPost[i]['name']),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
