import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:vibetag/screens/chat_screens/screen/profile_screen.dart';
import 'package:vibetag/screens/chat_screens/screen/view_media.dart';

import '../../constants.dart';
import '../../model/page_model.dart';

class PageMessage extends StatefulWidget {
   PageMessage(this.list,this.currentIndex,{Key? key}) : super(key: key);
  List<PageList> list;
  int currentIndex;
  @override
  State<PageMessage> createState() => _PageMessageState();
}

class _PageMessageState extends State<PageMessage> {
  final _dialog = RatingDialog(
    enableComment: false,
    initialRating: 0.0,
    // your app's name?
    title: const Text(
      'Rate Us',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    // encourage your user to leave a high rating?
    message: const Text(
      'How much you are satisfied with our product and services?',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ),
    // your app's logo?
   // image: const FlutterLogo(size: 100),
    submitButtonText: 'Submit',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');

      // TODO: add your own logic
      if (response.rating < 3.0) {
      } else {
        //_rateAndReviewApp();
      }
    },
  );

  // show the dialog
  bool _isShow = false;
  bool _isShowMessage = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, screenHeightSize(80, context)),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: highShadeOrangeColor,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
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
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                widget.list[widget.currentIndex].page_avatar.toString(),
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                            ),
                            // backgroundColor: Colors.white10,
                          ),

                          Positioned(
                            top: -1,
                            right: 3,
                            child: Container(
                              width: screenWidthSize(11, context),
                              height: screenHeightSize(11, context),
                              decoration: BoxDecoration(
                                  color: lightGreenColor,
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.list[widget.currentIndex].page_name.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: screenWidthSize(15, context)),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Last Seen: Now',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: screenWidthSize(12, context)),
                            ),
                          ],
                        ),
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  color: orangeColor.withOpacity(0.03),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: SvgPicture.asset(
                                'assets/images/Video-2.svg',
                              )),
                          const SizedBox(
                            width: 7,
                          ),
                          Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: orangeColor.withOpacity(0.03),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: SvgPicture.asset(
                                'assets/images/Fill 6-8.svg',
                              )),
                          const SizedBox(
                            width: 7,
                          ),
                          // SvgPicture.asset('assets/images/Group 76594.svg'),
                          PopupMenuButton(
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                              onSelected: (value) {
                                if (value == "View Profile") {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (_) {
                                  //       return const ProfileScreen();
                                  //     },
                                  //   ),
                                  // );
                                } else if (value == "View Media") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return const ViewMedia();
                                      },
                                    ),
                                  );
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
                                  "View Profile",
                                  "View Media",
                                  "Mute Notification",
                                  "Delete Chat",
                                  "Block",
                                  "Report",
                                ];
                                return items
                                    .map((e) => PopupMenuItem(
                                  value: e.toString(),
                                  child: Text(
                                    e.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
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
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: screenHeightSize(70, context),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(-4, 0),
                  spreadRadius: 2,
                  blurRadius: 2,
                  color: Color.fromRGBO(125, 140, 172, 0.47)),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                  decoration: BoxDecoration(
                    color: HexColor('#F8F9FB'),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: greyColor,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: screenWidthSize(28, context),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: screenWidthSize(200, context),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type a message here',
                            hintStyle: TextStyle(
                                color: fontColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: orangeColor,
                  ),
                  child: SvgPicture.asset(
                    'assets/images/Voice-2.svg',
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children:  [
                  Text(
                    "12:37",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: greyColor),
                  ),
                  const Spacer(),
                  Icon(Icons.more_horiz,color: greyColor,)
                ],
              ),
              const SizedBox(height: 5,),
              Visibility(
                visible: _isShowMessage,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFEBEFFB)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscin.",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffFF9200)),
                      borderRadius: BorderRadius.circular(10),
                      // color: const Color(0xFFEBEFFB)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "When does Nike deliver items?",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color:  Color(0xffFF9200)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffFF9200)),
                      borderRadius: BorderRadius.circular(10),
                      // color: const Color(0xFFEBEFFB)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "How do you hear about us?",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color:  Color(0xffFF9200)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffFF9200)),
                      borderRadius: BorderRadius.circular(10),
                      // color: const Color(0xFFEBEFFB)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "What is the purpose of our store?",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color:  Color(0xffFF9200)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffDBDEE5)),
                      borderRadius: BorderRadius.circular(10),
                      // color: const Color(0xFFEBEFFB)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "When does Nike deliver items?",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color:  Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFEBEFFB)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Answer: We Deliver item just after when someone make purchase(s).",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],),
              ),

              Visibility(
                visible: _isShow,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFFFFFFF)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text(
                          "About Us",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 15,),
                        const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
                           " The industry's standard dummy text ever",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFF1F4FB)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Followers",
                                style: TextStyle(
                                    fontSize: 14,

                                    ),
                              ),
                              Text(
                                "25k",
                                style: TextStyle(
                                    fontSize: 14,

                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFF1F4FB)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Products",
                                style: TextStyle(
                                  fontSize: 14,

                                ),
                              ),
                              Text(
                                "7k",
                                style: TextStyle(
                                  fontSize: 14,

                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFF1F4FB)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Reactions",
                                style: TextStyle(
                                  fontSize: 14,

                                ),
                              ),
                              Text(
                                "25k",
                                style: TextStyle(
                                  fontSize: 14,

                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ),
              ),
              const Expanded(
                  child: SizedBox(height: 15,)),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [

                    GestureDetector(
                      onTap:(){
                        setState(
                              () {
                            _isShow = !_isShow;
                            _isShowMessage=false;
                              },
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 110,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff485470)),
                          borderRadius: BorderRadius.circular(50),
                          // color: const Color(0xFFEBEFFB)
                        ),
                        child: const Center(
                          child: Text(
                            "Page Info",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color:  Color(0xff485470)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        showDialog(
                          context: context,
                          barrierDismissible: true, // set to false if you want to force a rating
                          builder: (context) => _dialog,
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 110,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff485470)),
                          borderRadius: BorderRadius.circular(50),
                          // color: const Color(0xFFEBEFFB)
                        ),
                        child: const Center(
                          child: Text(
                            "Rate Page",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color:  Color(0xff485470)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap:(){
                        setState(
                              () {
                            _isShowMessage = !_isShowMessage;
                            _isShow=false;
                          },
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 110,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff485470)),
                          borderRadius: BorderRadius.circular(50),
                          // color: const Color(0xFFEBEFFB)
                        ),
                        child: const Center(
                          child: Text(
                            "FAQ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color:  Color(0xff485470)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      height: 40,
                      width: 110,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff485470)),
                        borderRadius: BorderRadius.circular(50),
                        // color: const Color(0xFFEBEFFB)
                      ),
                      child: const Center(
                        child: Text(
                          "Latest Post",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color:  Color(0xff485470)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),

                  ],
                ),
              ),
              const SizedBox(height: 5,)




            ],
          ),
        ),
      ),
    );
  }
}
