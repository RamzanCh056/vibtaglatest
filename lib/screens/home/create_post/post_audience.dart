import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/screens/home/create_post/audience_option.dart';
import 'package:vibetag/utils/constant.dart';

class PostAudience extends StatefulWidget {
  const PostAudience({super.key});

  @override
  State<PostAudience> createState() => _PostAudienceState();
}

class _PostAudienceState extends State<PostAudience> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.55,
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
          Container(
            margin: spacing(
              horizontal: 25,
            ),
            child: Container(
              padding: spacing(
                vertical: 20,
              ),
              child: Text(
                'Edit Audience',
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
          audienceOptions(
            width: width,
            title: 'Public',
            subtitle: 'Anyone can see and join this room',
            icon: 'assets/icons/public.png',
            endIcon: 'assets/icons/circle_option.png',
            isTap: false,
          ),
          audienceOptions(
            width: width,
            title: 'Friends Only',
            subtitle: 'Only friends can see and join this room',
            icon: 'assets/icons/only_friends.png',
            endIcon: 'assets/icons/circle_option.png',
            isTap: true,
          ),
          audienceOptions(
            width: width,
            title: 'Custom Friends',
            subtitle: 'Only friends can see and join this room',
            icon: 'assets/icons/custom_friends.png',
            endIcon: 'assets/icons/circle_option.png',
            isTap: false,
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
    );
  }
}
