import 'package:flutter/material.dart';

import '../register/reusabletext.dart';

class WhyTraining extends StatefulWidget {
  const WhyTraining({Key? key}) : super(key: key);

  @override
  State<WhyTraining> createState() => _WhyTrainingState();
}

class _WhyTrainingState extends State<WhyTraining> {
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
                ReusableText(title: 'What Training Should I Be Doing to\nLose Weight?',size: 20,weight: FontWeight.w700,color: Color(0xff212121),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Image(
                      height: 40,width: 40,
                      image: AssetImage("Asset/images/form/Group 1000004117.png"),),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(title: 'mark_henry2',size: 15,weight: FontWeight.w700,color: Color(0xff485470),),
                        ReusableText(title: 'October 3, 2022',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),

                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      height: 46,
                      width: MediaQuery.of(context).size.width*0.58,
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
                    SizedBox(width: 10,),
                    Container(
                      height: 46,
                      width: 94,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffFF9200)),
                          borderRadius: BorderRadius.circular(26),color: Color(0xffFFFFFF)
                      ),
                      child:
                      Center(child: ReusableText(title: 'Reply',size: 16,weight: FontWeight.w600,color: Color(0xffFF9200),)),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,color: Color(0xffF1F4FB)
                      ),
                      child: Center(
                        child: Icon(Icons.share,color: Color(0xff99A7C7),),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
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
                      Image(
                        height: 40,width: 40,
                        image: AssetImage("Asset/images/form/Ellipse 911.png"),),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(title: 'mark_henry2',size: 15,weight: FontWeight.w700,color: Color(0xff485470),),
                          ReusableText(title: 'Posted December 2, 2022',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                        ],
                      ),
                      Spacer(),

                      Icon(Icons.more_vert,color: Color(0xffC8D1E5),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  ReusableText(title: 'Lorem Ipsum is simply dummy text of the printing\nand typesetting industry. Lorem Ipsum has been\nthe industry\'s standard dummy text ever since the\n1500s.',size: 14,weight: FontWeight.w500,color: Color(0xff485470),),
                  SizedBox(height: 10,),
                  Divider(thickness: 2,color: Color(0xffF1F4FB),height:2,),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Image(image: AssetImage("Asset/icons/form/Iconly Bold Chat.png")),
                      SizedBox(width: 10,),
                      ReusableText(title: '54 Replies',size: 13,weight: FontWeight.w500,color: Color(0xff485470),),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),color: Color(0xffF1F4FB)
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
                            borderRadius: BorderRadius.circular(20),color: Color(0xffF1F4FB)
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
                            borderRadius: BorderRadius.circular(20),color: Color(0xffF1F4FB)
                        ),
                        child: Center(child: ReusableText(title: 'Reply',size: 12,weight: FontWeight.w400,color: Color(0xff485470),)),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
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
                      Image(
                        height: 40,width: 40,
                        image: AssetImage("Asset/images/form/Ellipse 911.png"),),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(title: 'mark_henry2',size: 15,weight: FontWeight.w700,color: Color(0xff485470),),
                          ReusableText(title: 'Posted December 2, 2022',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                        ],
                      ),
                      Spacer(),

                      Icon(Icons.more_vert,color: Color(0xffC8D1E5),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  ReusableText(title: 'Lorem Ipsum is simply dummy text of the printing\nand typesetting industry. Lorem Ipsum has been\nthe industry\'s standard dummy text ever since the\n1500s.',size: 14,weight: FontWeight.w500,color: Color(0xff485470),),
                  SizedBox(height: 10,),
                  Divider(thickness: 2,color: Color(0xffF1F4FB),height:2,),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Image(image: AssetImage("Asset/icons/form/Iconly Bold Chat.png")),
                      SizedBox(width: 10,),
                      ReusableText(title: '54 Replies',size: 13,weight: FontWeight.w500,color: Color(0xff485470),),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),color: Color(0xffF1F4FB)
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
                            borderRadius: BorderRadius.circular(20),color: Color(0xffF1F4FB)
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
                            borderRadius: BorderRadius.circular(20),color: Color(0xffF1F4FB)
                        ),
                        child: Center(child: ReusableText(title: 'Reply',size: 12,weight: FontWeight.w400,color: Color(0xff485470),)),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
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
                      Image(
                        height: 40,width: 40,
                        image: AssetImage("Asset/images/form/Ellipse 911.png"),),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(title: 'mark_henry2',size: 15,weight: FontWeight.w700,color: Color(0xff485470),),
                          ReusableText(title: 'Posted December 2, 2022',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                        ],
                      ),
                      Spacer(),

                      Icon(Icons.more_vert,color: Color(0xffC8D1E5),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  ReusableText(title: 'Lorem Ipsum is simply dummy text of the printing\nand typesetting industry. Lorem Ipsum has been\nthe industry\'s standard dummy text ever since the\n1500s.',size: 14,weight: FontWeight.w500,color: Color(0xff485470),),
                  SizedBox(height: 10,),
                  Divider(thickness: 2,color: Color(0xffF1F4FB),height:2,),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Image(image: AssetImage("Asset/icons/form/Iconly Bold Chat.png")),
                      SizedBox(width: 10,),
                      ReusableText(title: '54 Replies',size: 13,weight: FontWeight.w500,color: Color(0xff485470),),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),color: Color(0xffF1F4FB)
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
                            borderRadius: BorderRadius.circular(20),color: Color(0xffF1F4FB)
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
                            borderRadius: BorderRadius.circular(20),color: Color(0xffF1F4FB)
                        ),
                        child: Center(child: ReusableText(title: 'Reply',size: 12,weight: FontWeight.w400,color: Color(0xff485470),)),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
      ),
    );
  }
}
