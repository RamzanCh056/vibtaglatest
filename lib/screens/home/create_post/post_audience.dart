import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vibetag/screens/home/create_post/audience_option.dart';
import 'package:vibetag/utils/constant.dart';
enum Gender { OnlyMe, all ,pepopleIFollow, pepopleFollowMe }

class PostAudience extends StatefulWidget {
  const PostAudience({super.key});

  @override
  State<PostAudience> createState() => _PostAudienceState();
}

class _PostAudienceState extends State<PostAudience> {

// 2.
  Gender? _gender = Gender.OnlyMe;
  int? privacyValue;
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return SingleChildScrollView(

      child: Container(
        height: height * 0.65,
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
      Container(
      padding: spacing(
      horizontal: 7,
      vertical: 7,
      ),
      margin: spacing(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
      color: grayLight,
      borderRadius: borderRadius(10),
      ),
      child:   RadioListTile<Gender>(
        secondary: Image.asset("assets/icons/only_friends.png", height: 25,width: 25,),
        controlAffinity: ListTileControlAffinity.trailing,
        title: const Text('Only Me', style: TextStyle(fontSize: 15),),
        subtitle: Text("Only Me can see and join this Post", style: TextStyle(fontSize: 13),),
        // 4.
        value: Gender.OnlyMe,
        // 5.
        groupValue: _gender,
        // 6.
        onChanged: (Gender? value) {
          setState(() {
            _gender = value;
            privacyValue= 3;
            print("privacyValue == ${privacyValue}");
          });
        },
      ),
      ),

            Container(
              padding: spacing(
                horizontal: 7,
                vertical: 7,
              ),
              margin: spacing(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: grayLight,
                borderRadius: borderRadius(10),
              ),
              child:   RadioListTile<Gender>(
                secondary: Image.asset("assets/icons/public.png",height: 25,width: 25, ),
                controlAffinity: ListTileControlAffinity.trailing,
                title: const Text('All', style: TextStyle(fontSize: 15),),
                subtitle: Text("Anyone can see and join this room", style: TextStyle(fontSize: 13),),
                // 4.
                value: Gender.all,
                // 5.
                groupValue: _gender,
                // 6.
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                    privacyValue= 0;
                    print("privacyValue == ${privacyValue}");
                  });
                },
              ),
            ),
            Container(
              padding: spacing(
                horizontal: 7,
                vertical: 7,
              ),
              margin: spacing(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: grayLight,
                borderRadius: borderRadius(10),
              ),
              child:   RadioListTile<Gender>(
                secondary: Image.asset("assets/icons/custom_friends.png",height: 25,width: 25, ),
                controlAffinity: ListTileControlAffinity.trailing,
                title: const Text('people i follow', style: TextStyle(fontSize: 15),),
                subtitle: Text("people you follow can see the post", style: TextStyle(fontSize: 13),),
                // 4.
                value: Gender.pepopleIFollow,
                // 5.
                groupValue: _gender,
                // 6.
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                    privacyValue= 2;
                    print("privacyValue == ${privacyValue}");
                  });
                },
              ),
            ),
            Container(
              padding: spacing(
                horizontal: 7,
                vertical: 7,
              ),
              margin: spacing(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: grayLight,
                borderRadius: borderRadius(10),
              ),
              child:   RadioListTile<Gender>(
                secondary: Image.asset("assets/icons/custom_friends.png",height: 25,width: 25, ),
                controlAffinity: ListTileControlAffinity.trailing,
                title: const Text('people Follow me', style: TextStyle(fontSize: 15),),
                subtitle: Text("people who follow you can see this post", style: TextStyle(fontSize: 13),),
                // 4.
                value: Gender.pepopleFollowMe,
                // 5.
                groupValue: _gender,
                // 6.
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value;
                    privacyValue= 1;
                    print("privacyValue == ${privacyValue}");
                  });
                },
              ),
            ),

            // audienceOptions(
            //   width: width,
            //   title: 'Public',
            //   subtitle: 'Anyone can see and join this room',
            //   icon: 'assets/icons/public.png',
            //   endIcon: 'assets/icons/circle_option.png',
            //   isTap: false,
            // ),
            // audienceOptions(
            //   width: width,
            //   title: 'Friends Only',
            //   subtitle: 'Only friends can see and join this room',
            //   icon: 'assets/icons/only_friends.png',
            //   endIcon: 'assets/icons/circle_option.png',
            //   isTap: true,
            // ),
            // audienceOptions(
            //   width: width,
            //   title: 'Custom Friends',
            //   subtitle: 'Only friends can see and join this room',
            //   icon: 'assets/icons/custom_friends.png',
            //   endIcon: 'assets/icons/circle_option.png',
            //   isTap: false,
            // ),
            gap(h: 30),
            Container(
              margin: spacing(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap:(){

                    },
                    child: Container(
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
                  ),
                  gap(w: 10),
                  GestureDetector(
                    onTap: (){
                      Fluttertoast.showToast(msg: "Privacy updated");
                      Navigator.pop(context);
                    },
                    child: Container(
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
