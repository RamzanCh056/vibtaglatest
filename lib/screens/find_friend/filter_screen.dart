import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../widgets/header.dart';
import '../../widgets/navbar.dart';
import 'model/Model.dart';
import 'package:http/http.dart' as http;

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool onlineUser = false;
  bool verifiedUser = false;
  final GlobalKey<ScaffoldState> key = GlobalKey();

  //visibility
  bool location = false;
  bool relationship = false;
  bool gender = false;
  List findFriends = [];

 findFriend()async{
   var headers = {
     'Cookie': 'PHPSESSID=1e5975e69cf73c2e0d9632149980bfc7; _us=1677568950; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-02-27%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
   };
   var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
   request.fields.addAll({
     'type': 'find_friends',
     'sub_type': 'find_firend',
     'user_id': '34099',
     'country': '226',
     'verified': 'all',
     'status': 'all',
     'image': 'all',
     'gender': 'all',
     'filterbyage': 'no',
     'age_from': '18',
     'age_to': '25',
     'relationship_id': '',
     'fid_bodytype': '',
     'fid_heights': '',
     'fid_education\n': '',
     'fid_ethnicity': '',
     'fid_3': '',
     'fid_4': '',
     'fid_5': '',
     'fid_6': '',
     'fid_7': '',
     'fid_8': '',
     'location': '',
     'form_lat': '',
     'form_lng': '',
     'amountRange': '',
     'search_type': 'normal'
   });

   request.headers.addAll(headers);

   http.StreamedResponse response = await request.send();

   if (response.statusCode == 200) {
     //print(await response.stream.bytesToString());
     var res = await response.stream.bytesToString();
     var body = jsonDecode(res);
     findFriends = body ['data'];
     print('find ==${findFriends}');
     setState(() {

       findFriends;
     });
   }
   else {
   print(response.reasonPhrase);
   }

 }
  @override
  void initState() {
    super.initState();
    findFriend();

  }
  final List<FilterModel> locationList = [
    FilterModel(title: 'Location 01', value: false),
    FilterModel(title: 'Toronto, Canada (354)', value: false),
    FilterModel(title: 'Location 02', value: false),
    FilterModel(title: 'Location 03', value: false),
  ];
  final List<FilterModel> genderList = [
    FilterModel(title: 'Both / Any (3504)', value: false),
    FilterModel(title: 'Female (354)', value: false),
    FilterModel(title: 'Location 02', value: false),
    FilterModel(title: 'Male (547)', value: false),
  ];
  final List<FilterModel> relationshipList = [
    FilterModel(title: 'Single', value: false),
    FilterModel(title: 'Couple', value: false),
  ];

  modelSheet(BuildContext context) {
    showModalBottomSheet(context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10),),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Text("Filter", style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18
                      ),),
                      InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close, color: Color(0xFFC8D1E5),)),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Divider(),

                  SizedBox(height: 20,),
                  Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFC8D1E5),),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Online Users",style: TextStyle(
                            fontWeight: FontWeight.w700,fontSize: 16,
                          ),
                          ),
                          FlutterSwitch(value: onlineUser,
                            width: 60,
                            activeColor: Color(0xFFFF9200),
                            onToggle: (bool value) {
                              setState(() {
                                onlineUser = value;
                              });
                            },),
                        ],
                      )

                  ),
                  SizedBox(height: 20,),
                  Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFC8D1E5),),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Verified Users",style: TextStyle(
                            fontWeight: FontWeight.w700,fontSize: 16,
                          ),
                          ),
                          FlutterSwitch(value: verifiedUser,
                            width: 60,
                            activeColor: Color(0xFFFF9200),
                            onToggle: (bool value) {
                              setState(() {
                                verifiedUser = value;
                              });
                            },),
                        ],
                      )

                  ),
                  //location
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      setState((){
                        location = !location;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            spreadRadius: 2,
                            blurRadius: 10
                          )
                        ]
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xFFC8D1E5),),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Location",style: TextStyle(
                                        fontWeight: FontWeight.w700,fontSize: 16,
                                      ),
                                      ),
                                      Text(
                                        "Toronto, Canada",style: TextStyle(
                                          fontWeight: FontWeight.w400,color: Color(0xFF7D8CAC)
                                      ),)
                                    ],
                                  ),
                                  Icon(Icons.keyboard_arrow_down,color: Color(0xFF99A7C7),),

                                ],
                              )

                              ),
                          Visibility(
                            visible: location,
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(locationList.length, (index){
                              return ListTile(
                                leading: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Checkbox(
                                    value: locationList[index].value,
                                    fillColor: MaterialStateProperty.all(Color(0xFFFF9200),),
                                    onChanged: (v){
                                      setState((){
                                        locationList[index].value = v!;
                                      });
                                    },
                                  ),
                                ),
                                title: Text(locationList[index].title,style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),),
                              );
                            }),
                          ),),
                        ],
                      ),
                    ),
                  ),
                  //relationship
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      setState((){
                        relationship = !relationship;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                spreadRadius: 2,
                                blurRadius: 10
                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xFFC8D1E5),),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Relationship",style: TextStyle(
                                        fontWeight: FontWeight.w700,fontSize: 16,
                                      ),
                                      ),
                                      Text(
                                        "Single Only",style: TextStyle(
                                          fontWeight: FontWeight.w400,color: Color(0xFF7D8CAC)
                                      ),)
                                    ],
                                  ),
                                  Icon(Icons.keyboard_arrow_down,color: Color(0xFF99A7C7),),

                                ],
                              )

                          ),
                          Visibility(
                            visible: relationship,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(relationshipList.length, (index){
                                return ListTile(
                                  leading: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Checkbox(
                                      value: relationshipList[index].value,
                                      fillColor: MaterialStateProperty.all(Color(0xFFFF9200),),
                                      onChanged: (v){
                                        setState((){
                                          relationshipList[index].value = v!;
                                        });
                                      },
                                    ),
                                  ),
                                  title: Text(relationshipList[index].title,style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),),
                                );
                              }),
                            ),),
                        ],
                      ),
                    ),
                  ),


                  //gender
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      setState((){
                        gender = !gender;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200,
                                spreadRadius: 2,
                                blurRadius: 10
                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xFFC8D1E5),),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Gender",style: TextStyle(
                                        fontWeight: FontWeight.w700,fontSize: 16,
                                      ),
                                      ),
                                      Text(
                                        "Both Male / Female",style: TextStyle(
                                          fontWeight: FontWeight.w400,color: Color(0xFF7D8CAC)
                                      ),)
                                    ],
                                  ),
                                  Icon(Icons.keyboard_arrow_down,color: Color(0xFF99A7C7),),

                                ],
                              )

                          ),
                          Visibility(
                            visible: gender,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(genderList.length, (index){
                                return ListTile(
                                  leading: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Checkbox(
                                      value: genderList[index].value,
                                      fillColor: MaterialStateProperty.all(Color(0xFFFF9200),),
                                      onChanged: (v){
                                        setState((){
                                          genderList[index].value = v!;
                                        });
                                      },
                                    ),
                                  ),
                                  title: Text(genderList[index].title,style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),),
                                );
                              }),
                            ),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(15),
                              color: Color(0xFFF1F4FB)
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF7D8CAC)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFFC107),
                                Color(0xFFFF8205),
                              ],
                            ),
                          ),
                          child: Text(
                            "Apply",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          );
        },);
      },);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: key,
        backgroundColor: Color(0xFFF0F3FA),
        body: Column(
          children: [
            Column(
              children: [
                NavBar(),
                Header(
                  
                ),
              ],
            ),

            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          contentPadding: EdgeInsets.only(left: 10),
                          prefixIcon: Icon(Icons.search_outlined),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      modelSheet(context);
                     // findFriend();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFFF9200),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.filter_list_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Filter",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: findFriends.length,
                  itemBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 130,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1EDED),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        findFriends[index]['cover'],
                                    ),
                                    fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Text(
                                      findFriends[index]['username'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                     findFriends[index]['working'],
                                      style: TextStyle(
                                          color: Color(0xFF485470),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xFFF8F9FB),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Likes",
                                                style: TextStyle(
                                                  color: Color(0xFF485470),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                              findFriends[index]['total_likes'],
                                                style: TextStyle(
                                                  color: Color(0xFF485470),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xFFF8F9FB),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Followers",
                                                style: TextStyle(
                                                  color: Color(0xFF485470),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "77",
                                                style: TextStyle(
                                                  color: Color(0xFF485470),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xFFF8F9FB),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Following",
                                                style: TextStyle(
                                                  color: Color(0xFF485470),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "412",
                                                style: TextStyle(
                                                  color: Color(0xFF485470),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFFFFC107),
                                                  Color(0xFFFF8205),
                                                ],
                                              ),
                                            ),
                                            child: Text(
                                              "Follow",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(17),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFFFF8205),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Text(
                                              "Message",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFFFF8205),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 70,
                            child: Container(
                              padding: EdgeInsets.all(3),
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: NetworkImage(
                                          findFriends[index]['avatar']),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },

               ),
            ),
          ],
        ),
      ),
    );
  }
}
