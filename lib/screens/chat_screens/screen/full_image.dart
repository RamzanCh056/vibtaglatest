import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:vibetag/screens/chat_screens/screen/profile_screen.dart';

import '../constants.dart';
import '../video_call/dialing_call.dart';
import '../video_call/video_call.dart';
// ignore: must_be_immutable
class FullImageSender extends StatefulWidget {

  String? image;
  String? lastSceen;
  String? profileImage;
  String? userName;
  FullImageSender(this.image, this.lastSceen,this.profileImage,this.userName,{Key? key}) : super(key: key);

  @override
  State<FullImageSender> createState() => _FullImageSenderState();
}

class _FullImageSenderState extends State<FullImageSender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, screenHeightSize(63, context)),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          //backgroundColor: highShadeOrangeColor,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [ Colors.black, Colors.black]),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              widget.profileImage.toString(),
                              height: 45,
                              fit: BoxFit.fill,
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.userName.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: screenWidthSize(15, context)),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.lastSceen.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: screenWidthSize(12, context)),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/images/Star-5.png',
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Image.asset(
                            'assets/images/Vector.png',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          // SvgPicture.asset('assets/images/Group 76594.svg'),
                          PopupMenuButton(
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                size: 28,
                              ),
                              onSelected: (value) {
                                if (value == "View Profile") {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (_) {
                                  //       // return ProfileScreen(
                                  //       //   widget.currentIndex,
                                  //       //   widget.list,
                                  //       // );
                                  //     },
                                  //   ),
                                  // );
                                } else if (value == "View Media") {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (_) {
                                  //       return const ViewMedia();
                                  //     },
                                  //   ),
                                  // );
                                }

                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              itemBuilder: (_) {
                                final List items = [
                                  "Download",
                                  "Share",
                                  "Report",
                                ];
                                return items
                                    .map((e) => PopupMenuItem(
                                  value: e.toString(),
                                  child: Text(
                                    e.toString(),
                                    style: const TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ))
                                    .toList();
                              }),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 75,),
            Center(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFEBEFFB)
                  ),
                  child: Image.network(widget.image.toString(),
                    //fit: BoxFit.cover,
                  )
              ),
            ),
            Expanded(
                child: SizedBox(height: 3,)),
            Container(
                height: 85,
                color: Color(0xff2C2C2C),
                //Theme.of(context).primaryColor,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                       // controller: messageController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Reply here",
                          hintStyle: TextStyle(
                            //  fontFamily: fontMedium,
                              color: Color(0xFF777777)),
                          filled: true,

                          fillColor: Colors.black,

                          //Color(0xFF252525),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                               //   _AddModalBottomSheet(context);
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Color(0xff323232),
                                      borderRadius:
                                      BorderRadius.circular(100)),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ),
                          suffixIcon: Icon(
                            Icons.keyboard_voice_outlined,
                            color: Colors.white,
                          ),
                          // GestureDetector(
                          //             onTap: (){
                          //               sendMessage();
                          //             },
                          //             child: Image.asset(
                          //               'images/Group 76556.png',
                          //             ),
                          //           ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(200),
                            borderSide: BorderSide(
                                color: Colors.white, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(200),
                            borderSide: BorderSide(
                                color: Color(0xFF252525), width: 2.0),
                          ),

                          //contentPadding: EdgeInsets.only(left: 12, right: 8, bottom: 0)
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),

                    SizedBox(
                      width: 5,
                    ),
                  ],
                )),
          ],
        ),
      ),

    );
  }
}
