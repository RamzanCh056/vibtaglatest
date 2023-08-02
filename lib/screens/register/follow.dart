import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:vibetag/screens/register/reusabletext.dart';

import 'congrats.dart';

class FollowScreen extends StatefulWidget {
  const FollowScreen({Key? key}) : super(key: key);

  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: LinearProgressBar(
                      maxSteps: 16,
                      minHeight: 10,
                      progressType: LinearProgressBar
                          .progressTypeLinear, // Use Linear progress
                      currentStep: 4,
                      progressColor: const Color(0xffFF9243),
                      backgroundColor: const Color(0xffF1F4FB),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    "4/16",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                 Icon(Icons.local_fire_department,color: Colors.yellow,),
                  SizedBox(
                    width: 15,
                  ),
                  ReusableText(
                    title: 'Follow Famous People',
                    weight: FontWeight.w700,
                    size: 20,
                    color: Color(0xff212121),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const ReusableText(
                title:
                "Your profile picture must have your face in it.",
                color: Color(0xff7D8CAC),
                size: 14,
                weight: FontWeight.w400,
              ),
              const SizedBox(
                height: 20,
              ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(12),
              border: Border.all(color: Color(0xff7D8CAC),
              )

            ),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("Asset/images/Ellipse 752 (1).png"),

                  ),
                  title: Row(
                    children: [
                      ReusableText(title: "Justin Wilson",weight: FontWeight.w600,size:15 ,color: Color(0xff212121),),
                      SizedBox(width: 10,),
                     Image(image: AssetImage("Asset/icons/register/Subtract.png")),
                    ],
                  ),
                  subtitle: ReusableText(title: '@david_wilson23',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                trailing: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffFF9243)),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: ReusableText(
                    title: 'Follow',
                    size: 14,weight: FontWeight.w600,color: Color(0xffFF9243),
                  ),
                ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ReusableText(title: "103k",size: 14,weight: FontWeight.w600,color: Color(0xff485470),),
                        ReusableText(title: "Like",size: 11,weight: FontWeight.w400,color: Color(0xff7D8CAC),),
                      ],
                    ),
                    Expanded(child: VerticalDivider(thickness: 10,width:3,color: Color(0xffE6EAF3),)),
                    Column(
                      children: [
                        ReusableText(title: "24.5k",size: 14,weight: FontWeight.w600,color: Color(0xff485470),),
                        ReusableText(title: "Followers",size: 11,weight: FontWeight.w400,color: Color(0xff7D8CAC),),
                      ],
                    ),
                    Expanded(child: VerticalDivider(thickness: 3,width:3,color: Color(0xffE6EAF3),)),
                    Column(
                      children: [
                        ReusableText(title: "104k",size: 14,weight: FontWeight.w600,color: Color(0xff485470),),
                        ReusableText(title: "Following",size: 11,weight: FontWeight.w400,color: Color(0xff7D8CAC),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(12),
                    border: Border.all(color: Color(0xff7D8CAC),
                    )

                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("Asset/images/Ellipse 752.png"),

                      ),
                      title: Row(
                        children: [
                          ReusableText(title: "Justin Wilson",weight: FontWeight.w600,size:15 ,color: Color(0xff212121),),
                          SizedBox(width: 10,),
                          Image(image: AssetImage("Asset/icons/register/Subtract.png")),
                        ],
                      ),
                      subtitle: ReusableText(title: '@david_wilson23',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                      trailing: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffFF9243)),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: ReusableText(
                          title: 'Follow',
                          size: 14,weight: FontWeight.w600,color: Color(0xffFF9243),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ReusableText(title: "103k",size: 14,weight: FontWeight.w600,color: Color(0xff485470),),
                            ReusableText(title: "Like",size: 11,weight: FontWeight.w400,color: Color(0xff7D8CAC),),
                          ],
                        ),
                        Expanded(child: VerticalDivider(thickness: 10,width:3,color: Color(0xffE6EAF3),)),
                        Column(
                          children: [
                            ReusableText(title: "24.5k",size: 14,weight: FontWeight.w600,color: Color(0xff485470),),
                            ReusableText(title: "Followers",size: 11,weight: FontWeight.w400,color: Color(0xff7D8CAC),),
                          ],
                        ),
                        Expanded(child: VerticalDivider(thickness: 3,width:3,color: Color(0xffE6EAF3),)),
                        Column(
                          children: [
                            ReusableText(title: "104k",size: 14,weight: FontWeight.w600,color: Color(0xff485470),),
                            ReusableText(title: "Following",size: 11,weight: FontWeight.w400,color: Color(0xff7D8CAC),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(12),
                    border: Border.all(color: Color(0xff7D8CAC),
                    )

                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("Asset/images/Ellipse 752.png"),

                      ),
                      title: Row(
                        children: [
                          ReusableText(title: "Justin Wilson",weight: FontWeight.w600,size:15 ,color: Color(0xff212121),),
                          SizedBox(width: 10,),
                          Image(image: AssetImage("Asset/icons/register/Subtract.png")),
                        ],
                      ),
                      subtitle: ReusableText(title: '@david_wilson23',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                      trailing: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffFF9243)),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: ReusableText(
                          title: 'Follow',
                          size: 14,weight: FontWeight.w600,color: Color(0xffFF9243),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ReusableText(title: "103k",size: 14,weight: FontWeight.w600,color: Color(0xff485470),),
                            ReusableText(title: "Like",size: 11,weight: FontWeight.w400,color: Color(0xff7D8CAC),),
                          ],
                        ),
                        Expanded(child: VerticalDivider(thickness: 10,width:3,color: Color(0xffE6EAF3),)),
                        Column(
                          children: [
                            ReusableText(title: "24.5k",size: 14,weight: FontWeight.w600,color: Color(0xff485470),),
                            ReusableText(title: "Followers",size: 11,weight: FontWeight.w400,color: Color(0xff7D8CAC),),
                          ],
                        ),
                        Expanded(child: VerticalDivider(thickness: 3,width:3,color: Color(0xffE6EAF3),)),
                        Column(
                          children: [
                            ReusableText(title: "104k",size: 14,weight: FontWeight.w600,color: Color(0xff485470),),
                            ReusableText(title: "Following",size: 11,weight: FontWeight.w400,color: Color(0xff7D8CAC),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width*1,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CongratsScreen()));
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 274,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color(0xffFFC107),
                          Color(0xffFF8205),
                        ]),
                        color: const Color(0xffCCCCCC),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          ReusableText(
                            title: "Save and Continue",
                            color: Colors.white,
                            weight: FontWeight.w800,
                            size: 17,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.arrow_circle_right_sharp,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
