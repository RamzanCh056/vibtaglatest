import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:vibetag/utils/constant.dart';
import '../../widgets/header.dart';
import '../../widgets/navbar.dart';
import '../my_page_screen/browse_event_screen.dart';
class CreateBusinessPage extends StatefulWidget {
  CreateBusinessPage({Key? key}) : super(key: key);

  @override
  State<CreateBusinessPage> createState() => _CreateBusinessPageState();
}

class _CreateBusinessPageState extends State<CreateBusinessPage> {
  final formKey = GlobalKey<FormState>();
  var selectData = [];
  var catagoryId ;
  final Catagory = TextEditingController();
  final pageName = TextEditingController();
  final pageTitle = TextEditingController();
  final pageDescritpion = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isLoading = false;
  createPage()async{
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Cookie': 'PHPSESSID=65aa2c9fc4687e42480ad9f915558455; _us=1669384827; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-11-24%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'create_page',
      'user_id': loginUserId.toString(),
      'page_title': pageTitle.text,
      'page_name': pageName.text,
      'page_description': pageDescritpion.text,
      'page_category': catagoryId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //  print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var newError;
      if (body['errors'] != null) {
        var errorText = body['errors'][0];
        Fluttertoast.showToast(msg: "$errorText");
        print("i am Error text $errorText");
        setState(() {
          isLoading = false;
        });
      } else {

        var message = body['api_text'];
        var pageName = body['page_name'];
        print("i am new success $message");
        Fluttertoast.showToast(msg: "${message} created ${pageName}");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPageHomeScreen()));
       // Get.to(const MyPageHomeScreen());
        setState(() {
          isLoading = false;
        });


      }
    }
    else {
      print(response.reasonPhrase);
      setState(() {
        isLoading = false;
      });
    }

  }

  getPageCatagory()async{
    var headers = {
      'Cookie': 'PHPSESSID=65aa2c9fc4687e42480ad9f915558455; _us=1669384785; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-11-24%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'get_page_categories',
      'user_id': loginUserId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      selectData = body;
      // var respon = body[0];
      // var nwres = respon['value'];
      print("body oy $selectData");
    }
    else {
      print(response.reasonPhrase);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
          child: SafeArea(

            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Column(
                    children: [
                      NavBar(),
                      Header(
                        onTap: () {
                          _key.currentState!.openDrawer();
                        },
                      )
                    ],
                   ),
                //  CommonAppBar(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Start Your Business Page',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            color: Colors.grey.shade300,
                            height: 150,
                          ),
                          Container(
                            color: Colors.black,
                            height: 50,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Image.asset('assets/images/Path 352.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Create Page',
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                                const Spacer(),
                                const Text(
                                  '< My Page',
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Page sluck',
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 10, right: 10, bottom: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  onChanged: (value) {
                                    //Do something with the user input.
                                  },
                                  controller: pageName,
                                  decoration: const InputDecoration(
                                    hintText: 'Name',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white, width: 1.0),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white, width: 2.0),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Page Title',
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 10, right: 10, bottom: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: pageTitle,
                                  onChanged: (value) {
                                    //Do something with the user input.
                                  },

                                  decoration: const InputDecoration(
                                    hintText: 'Page Title',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white, width: 1.0),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white, width: 2.0),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Page Category',
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 10, right: 10, bottom: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    showDialogForCatagory();

                                  },
                                  child: TextFormField(
                                    onChanged: (value) {
                                      //Do something with the user input.
                                    },
                                    controller: Catagory,
                                    decoration: const InputDecoration(

                                      enabled: false,
                                      suffixIcon:  Icon(Icons.arrow_drop_down),
                                      hintText: 'When this event will start?',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20.0),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.white, width: 1.0),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.white, width: 2.0),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Page Description',
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 10, right: 10, bottom: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: pageDescritpion,
                                  maxLines: 7,
                                  onChanged: (value) {
                                    //Do something with the user input.
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Description here...',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white, width: 1.0),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white, width: 2.0),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  'Your page description between 10 to 200 characters max.',
                                  style: TextStyle(color: Colors.grey, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: Colors.black,
                                  )),
                              const SizedBox(width: 2),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Go Back',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              const Spacer(),
                              isLoading?
                              const Center(
                                child: CircularProgressIndicator()
                              )
                                  :  MaterialButton(
                                minWidth: 120,
                                color: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                onPressed: () {

                                  if(formKey.currentState!.validate()){
                                    createPage();
                                  }
                                },
                                child: const Text(
                                  'Publish',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  Container(
                    color: const Color(0xffFF9200),
                    child: Column(children: [
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Column(
                            children: const [
                              Text(
                                'Market Place\nTerms',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: const [
                              Text(
                                'Refund \nPolicy',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: const [
                              Text(
                                'Start\nSelling',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Column(
                            children: const [
                              Text(
                                'Your\nWishlist',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: const [
                              Text(
                                'On Sale\nItems',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: const [
                              Text(
                                'Fing Help &\nSupport',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }
  showDialogForCatagory() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Select catagory'),
            content:Container(
              height: 540,
              child: FutureBuilder(
                  future:  getPageCatagory(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if ( snapshot.data!=null || selectData!=null) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: selectData.length,//photoList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(

                              child: Column(

                                children: [
                                  Container(
                                    // height: 20,
                                    // width: 100,
                                      child:Text( selectData[index]['label'].toString(),)
                                  ),
                                  const Divider(),

                                ],),
                              onTap: () {
                                Navigator.pop(context);
                                Catagory.text =  selectData[index]['label'].toString();
                                catagoryId = selectData[index]['value'].toString();
                                // print("i am current label  ${  Catagory.text}");
                                // print("i am current id  ${  catagoryId}");
                                setState(() {});
                              },
                            );

                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          );
        });
  }
}
class MenuItem {
  final String text;


  const MenuItem({
    required this.text,

  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [WhatsTranding, Buzzin, Explore,ShopCart,];
  static const List<MenuItem> secondItems = [MyAds];

  static const WhatsTranding = MenuItem(text: 'Whats Trending',);
  static const Buzzin = MenuItem(text: 'Buzzin', );
  static const Explore = MenuItem(text: 'Explore', );
  static const ShopCart = MenuItem(text: 'Shop Cart', );
  static const MyAds = MenuItem(text: 'My Ads', );

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        // Icon(
        //     item.icon,
        //     color: Colors.white,
        //     size: 22
        // ),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }



}
