import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibetag/screens/home/create_post/create_post.dart';
import 'package:vibetag/screens/profile/profile.dart';

import '../../../utils/constant.dart';
import '../../../widgets/bottom_modal_sheet_widget.dart';

class createPost extends StatefulWidget {
  createPost(this.user, {Key? key}) : super(key: key);
  late Map<String, dynamic> user;

  @override
  State<createPost> createState() => _createPostState();
}

class _createPostState extends State<createPost> {
  @override
  Widget build(BuildContext context) {
    return HomeSearchBar(modelUser: widget.user);
  }

  Widget HomeSearchBar({
    required Map<String, dynamic> modelUser,
  }) {
    return StatefulBuilder(builder: (context, setState) {
      double width = deviceWidth(context: context);
      double height = deviceHeight(context: context);
      return Container(
        margin: spacing(
          vertical: 10,
        ),
        padding: spacing(
          vertical: 10,
          horizontal: 10,
        ),
        width: double.maxFinite,
        color: white,
        height: height * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                pushRoute(
                  context: context,
                  screen: Profile(user_id: '${loginUserId}'),
                );
              },
              child: Container(
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
                  foregroundImage: NetworkImage(
                    modelUser['avatar'],
                  ),
                ),
              ),
            ),
            Container(
              width: width * 0.65,
              decoration: BoxDecoration(
                color: grayLight,
                borderRadius: borderRadius(width),
              ),
              child: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    createBottomModalSheet(
                      context: context,
                      screen: CreatePost(
                        modelUser['avatar'],
                        modelUser['username'],
                      ),
                    );
                  },
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: 'What\'s your Vibe 🤙',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                        bottom: 0,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500,
                        color: lightblue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                createBottomModalSheet(
                  context: context,
                  screen:
                      CreatePost(modelUser['avatar'], modelUser['username']),
                );
              },
              child: Container(
                height: width * 0.11,
                width: width * 0.11,
                child: Image.asset(
                  'assets/new/icons/create_post_plus_icon.png',
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
