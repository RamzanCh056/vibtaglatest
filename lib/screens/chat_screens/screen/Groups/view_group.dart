import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/screens/chat_screens/screen/call_history.dart';
import 'package:vibetag/screens/chat_screens/widgets/reusable_listtile.dart';

import '../../constants.dart';
import '../pages/change_theme.dart';
class ViewGroup extends StatefulWidget {
  const ViewGroup({Key? key}) : super(key: key);

  @override
  State<ViewGroup> createState() => _ViewGroupState();
}

class _ViewGroupState extends State<ViewGroup> {
  bool value = false;
  List<String> images= [
    "assets/you.png",
    "assets/anothergroup.png",
    "assets/3rdgroup.png",
    "assets/grouppic.png",
    "assets/mygroup.png",
    "assets/mygroup.png",

  ];
  List<String> names= [
    "Ramzan",
    "Imran khan",
    "Nawaz sharef",
    "Waqas",
    "azam swati",



  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    const Text(
                      "Mark Henry",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "@mark_h01",
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
                            title: "Invite people",
                            handler: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    const Divider(color: Colors.grey),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        mainAxisExtent: 182,

                      ),
                      itemCount: images.length,
                      itemBuilder: buildListItem,

                    ),

                    const SizedBox(height: 10,),
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
                    border: Border.all(color: Colors.white, width: 3),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage("assets/images/Group 76548.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildListItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: (){
        index ==5?
            Container():
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(17), topLeft: Radius.circular(17)),
          ),
          builder: (BuildContext context) {
            return Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(),
              child: Column(

                children:  [
                  const SizedBox(height: 10,),
                    const Text("Remove Member"),
                  const SizedBox(height: 10,),
                  const Text("Are you sure you want to remove William Chills from this Group?", style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,

                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,

                    backgroundImage:  AssetImage(images[index]),

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(names[index]),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text("@mark_h01", style: TextStyle(fontSize: 12),),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 5,),
                    Expanded(

                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.grey)
                          ),
                          child: const Center(child: Text('Cancle')),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xffFD4585)
                        ),
                        child: const Center(child: Text('Yes', style: TextStyle(color: Colors.white),),),
                      ),
                    ),
                      const SizedBox(width: 5,),






                  ],)

                ],
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFF1F4FB),
        ),
        //color: Colors.red,

        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, ),
            child: Column(
              children: [
                const SizedBox( height: 10,),
                index ==0?
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text("Admin", style: TextStyle(color: Color(0xff49C658)),
                      textAlign: TextAlign.end,

                    ),
                  ],
                ):Container(),
                index ==5?
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xff99A7C7),
                  child: Text("24", style: TextStyle(color: Colors.white),),

                ):
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,

                  backgroundImage:  AssetImage(images[index]),

                ),
                const SizedBox(height: 10,),

             index ==5?  const Text("See all"):   Text(names[index]),
                const SizedBox(height: 2,),
                index ==5? Container(): const Text("@mark_h01", style: TextStyle(fontSize: 12),),
                const SizedBox( height: 10,),


              ],),
          ),
        ),


      ),
    );
  }

}
