import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/screens/chat_screens/screen/pages/change_theme.dart';

import '../../../utils/constant.dart';
import '../constants.dart';
import '../model/show_list_message_model.dart';
import '../widgets/reusable_listtile.dart';
import 'call_history.dart';

class ProfileScreen extends StatefulWidget {
   ProfileScreen(this.currentIndex, this.list,{key});
   List<MessageList> list;
   int currentIndex;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              // Background image
              Container(
                height: 150,
                width: double.infinity,
                color: highShadeOrangeColor,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        )),
                    InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 30,
                        )),
                  ],
                ),
              ),

              // Profile information
              Container(
                margin: const EdgeInsets.only(top: 200.0),
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                     Text(
                       loginUserId != widget.list[widget.currentIndex].rec_id
                           ? widget.list[widget.currentIndex].rec_name.toString()
                           : widget.list[widget.currentIndex].sen_name.toString(),
                     //widget.list[widget.currentIndex].rec_name.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     Text(
                       loginUserId != widget.list[widget.currentIndex].rec_id?
                      "@${ widget.list[widget.currentIndex].rec_name.toString()}":
                       "@${widget.list[widget.currentIndex].sen_name.toString()}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFF1F4FB)),
                          child: Image.asset(
                            "assets/images/Calling-3.png",
                            height: 25,
                            width: 25,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFF1F4FB)),
                          child: Image.asset(
                            "assets/images/Video-2.png",
                            height: 25,
                            width: 25,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFF1F4FB)),
                          child: Image.asset(
                            "assets/images/Profile-3.png",
                            height: 25,
                            width: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      color: Color(0xFFF1F4FB),
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Card(
                              elevation: 0,
                              color: const Color(0xFFF1F4FB),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 16),
                                leading: Image.asset(
                                    "assets/images/Notification-3.png"),
                                title: RichText(
                                  text: const TextSpan(
                                      text: "Notification ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: "of",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey),
                                        )
                                      ]
                                  ),
                                ),
                                trailing: CupertinoSwitch(value: value, onChanged: (v){
                                  setState(() {
                                    value = v;
                                  });
                                }),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ReusableListTile(
                            image: "assets/images/Star-3.png",
                            title: "View Starred Messages",
                            handler: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ReusableListTile(
                            image: "assets/images/Image-2.png",
                            title: "View Media",
                            handler: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ReusableListTile(
                            image: "assets/images/Vector (2).png",
                            title: "Change theme",
                            handler: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChangeTheme()));




                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ReusableListTile(
                            image: "assets/images/Time Circle-2.png",
                            title: "Call History",
                            handler: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CallHistory()));
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ReusableListTile(
                            image: "assets/images/Group 75662.png",
                            title: "Share contact",
                            handler: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ReusableListTile(
                            image: "assets/images/3 Friends.png",
                            title: "Create Group with Mark",
                            handler: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),

              // Profile picture
              Positioned(
                top: 80.0,
                left: 0,
                right: 0,
                child: Container(
                  width: 130.0,
                  height: 130.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 3),
                    shape: BoxShape.circle,
                    image:  DecorationImage(
                      image:NetworkImage(
                        loginUserId != widget.list[widget.currentIndex].rec_id
                            ? widget.list[widget.currentIndex].rec_pic.toString()
                            : widget.list[widget.currentIndex].sen_pic.toString(),

                         // widget.list[widget.currentIndex].rec_pic.toString()
                      ),

                    ),
                  ),
                  // child: ClipRRect(
                  //   borderRadius: BorderRadius.circular(30),
                  //   child: Image.network(
                  //     widget.list[widget.currentIndex].rec_pic.toString(),
                  //
                  //     height: 45,
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
