import 'package:flutter/material.dart';
import 'package:vibetag/screens/forum_design/why_training.dart';

import '../register/reusabletext.dart';

class FitnessIngym extends StatefulWidget {
  const FitnessIngym({Key? key}) : super(key: key);

  @override
  State<FitnessIngym> createState() => _FitnessIngymState();
}

class _FitnessIngymState extends State<FitnessIngym> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Color(0xffFFFFFF)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }
        , icon: Icon(Icons.arrow_back_outlined,color: Color(0xff000000),),),
                  SizedBox(height: 15,),
                  ReusableText(title: 'Fitness in Gym',size: 18,weight: FontWeight.w700,color: Color(0xff212121),),
                  SizedBox(height: 10,),
                  ReusableText(title: 'Exercise and Nutrition for Optimal Fitness" - This\ntopic emphasizes the importance of regular exercise\nand healthy...',size: 14,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                  SizedBox(height: 10,),
                  Container(
                    height: 46,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),color: Color(0xffF1F4FB)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        ReusableText(title: 'Subscribe',size: 16,weight: FontWeight.w600,color: Color(0xff485470),),
                        Spacer(),
                        Container(
                          width: 70,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26),color: Color(0xffFFFFFF)
                        ),
                          child: Center(child: ReusableText(title: '245',size: 16,weight: FontWeight.w600,color: Color(0xff485470),)) ,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WhyTraining()));
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),color: Color(0xffFFFFFF)
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(image: AssetImage("Asset/images/form/Ellipse 911.png"),),
                          Spacer(),
                          Column(
                            children: [
                              ReusableText(title: 'Replies',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                              SizedBox(height: 10,),
                              ReusableText(title: '235',size: 16,weight: FontWeight.w700,color: Color(0xff485470),),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              ReusableText(title: 'Views',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                              SizedBox(height: 10,),
                              ReusableText(title: '3.2k',size: 16,weight: FontWeight.w700,color: Color(0xff485470),),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.more_vert,color: Color(0xffC8D1E5),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      ReusableText(title: 'What Training Should I Be Doing to Lose\nWeight?',size: 15,weight: FontWeight.w600,color: Color(0xff212121),),
                      SizedBox(height: 10,),
                      ReusableText(title: 'By mark_henry2, 14 Feb, 2023',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                      SizedBox(height: 15,),
                      ReusableText(title: 'Lorem Ipsum is simply dummy text of the printing\nand typesetting industry. Lorem Ipsum has been\nthe industry\'s standard dummy text ever since the\n1500s.',size: 14,weight: FontWeight.w500,color: Color(0xff485470),),
                      SizedBox(height: 10,),
                      Divider(thickness: 2,color: Color(0xffF1F4FB),height:2,),
                      SizedBox(height: 10,),
                      ReusableText(title: 'Last reply by mark_henry2, 13 minutes ago',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),color: Color(0xffF1F4FB)
                            ),
                           child: Row(
                              children: [
                              Image(image: AssetImage("Asset/images/form/like (1) 1.png")),
                                SizedBox(width: 15,),
                                ReusableText(title: '122',size: 12,weight: FontWeight.w400,color: Color(0xff485470),),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),color: Color(0xffF1F4FB)
                            ),
                            child: Row(
                              children: [
                                Image(image: AssetImage("Asset/images/form/like (1) 1.png")),
                                SizedBox(width: 15,),
                                ReusableText(title: '122',size: 12,weight: FontWeight.w400,color: Color(0xff485470),),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),color: Color(0xffF1F4FB)
                            ),
                            child: Center(child: ReusableText(title: 'Reply',size: 12,weight: FontWeight.w400,color: Color(0xff485470),)),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WhyTraining()));
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),color: Color(0xffFFFFFF)
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(image: AssetImage("Asset/images/form/Ellipse 911.png"),),
                          Spacer(),
                          Column(
                            children: [
                              ReusableText(title: 'Replies',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                              SizedBox(height: 10,),
                              ReusableText(title: '235',size: 16,weight: FontWeight.w700,color: Color(0xff485470),),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              ReusableText(title: 'Views',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                              SizedBox(height: 10,),
                              ReusableText(title: '3.2k',size: 16,weight: FontWeight.w700,color: Color(0xff485470),),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.more_vert,color: Color(0xffC8D1E5),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      ReusableText(title: 'What Training Should I Be Doing to Lose\nWeight?',size: 15,weight: FontWeight.w600,color: Color(0xff212121),),
                      SizedBox(height: 10,),
                      ReusableText(title: 'By mark_henry2, 14 Feb, 2023',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                      SizedBox(height: 15,),
                      ReusableText(title: 'Lorem Ipsum is simply dummy text of the printing\nand typesetting industry. Lorem Ipsum has been\nthe industry\'s standard dummy text ever since the\n1500s.',size: 14,weight: FontWeight.w500,color: Color(0xff485470),),
                      SizedBox(height: 10,),
                      Divider(thickness: 2,color: Color(0xffF1F4FB),height:2,),
                      SizedBox(height: 10,),
                      ReusableText(title: 'Last reply by mark_henry2, 13 minutes ago',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),color: Color(0xffF1F4FB)
                            ),
                           child: Row(
                              children: [
                              Image(image: AssetImage("Asset/images/form/like (1) 1.png")),
                                SizedBox(width: 15,),
                                ReusableText(title: '122',size: 12,weight: FontWeight.w400,color: Color(0xff485470),),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),color: Color(0xffF1F4FB)
                            ),
                            child: Row(
                              children: [
                                Image(image: AssetImage("Asset/images/form/like (1) 1.png")),
                                SizedBox(width: 15,),
                                ReusableText(title: '122',size: 12,weight: FontWeight.w400,color: Color(0xff485470),),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),color: Color(0xffF1F4FB)
                            ),
                            child: Center(child: ReusableText(title: 'Reply',size: 12,weight: FontWeight.w400,color: Color(0xff485470),)),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WhyTraining()));
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),color: Color(0xffFFFFFF)
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(image: AssetImage("Asset/images/form/Ellipse 911.png"),),
                          Spacer(),
                          Column(
                            children: [
                              ReusableText(title: 'Replies',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                              SizedBox(height: 10,),
                              ReusableText(title: '235',size: 16,weight: FontWeight.w700,color: Color(0xff485470),),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              ReusableText(title: 'Views',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                              SizedBox(height: 10,),
                              ReusableText(title: '3.2k',size: 16,weight: FontWeight.w700,color: Color(0xff485470),),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.more_vert,color: Color(0xffC8D1E5),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      ReusableText(title: 'What Training Should I Be Doing to Lose\nWeight?',size: 15,weight: FontWeight.w600,color: Color(0xff212121),),
                      SizedBox(height: 10,),
                      ReusableText(title: 'By mark_henry2, 14 Feb, 2023',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                      SizedBox(height: 15,),
                      ReusableText(title: 'Lorem Ipsum is simply dummy text of the printing\nand typesetting industry. Lorem Ipsum has been\nthe industry\'s standard dummy text ever since the\n1500s.',size: 14,weight: FontWeight.w500,color: Color(0xff485470),),
                      SizedBox(height: 10,),
                      Divider(thickness: 2,color: Color(0xffF1F4FB),height:2,),
                      SizedBox(height: 10,),
                      ReusableText(title: 'Last reply by mark_henry2, 13 minutes ago',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),color: Color(0xffF1F4FB)
                            ),
                           child: Row(
                              children: [
                              Image(image: AssetImage("Asset/images/form/like (1) 1.png")),
                                SizedBox(width: 15,),
                                ReusableText(title: '122',size: 12,weight: FontWeight.w400,color: Color(0xff485470),),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),color: Color(0xffF1F4FB)
                            ),
                            child: Row(
                              children: [
                                Image(image: AssetImage("Asset/images/form/like (1) 1.png")),
                                SizedBox(width: 15,),
                                ReusableText(title: '122',size: 12,weight: FontWeight.w400,color: Color(0xff485470),),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),color: Color(0xffF1F4FB)
                            ),
                            child: Center(child: ReusableText(title: 'Reply',size: 12,weight: FontWeight.w400,color: Color(0xff485470),)),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
