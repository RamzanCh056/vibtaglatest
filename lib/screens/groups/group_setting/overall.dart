import 'package:flutter/material.dart';

import '../../register/reusabletext.dart';

class OverAllScreen extends StatefulWidget {
  const OverAllScreen({Key? key}) : super(key: key);

  @override
  State<OverAllScreen> createState() => _OverAllScreenState();
}

class _OverAllScreenState extends State<OverAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12) ,
              color: Color(0xffFFFFFF),
              border: Border.all(color: Color(0xffC8D1E5))
          ),
          child: Row(
            children: [
              SizedBox(width: 25,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image(image: AssetImage("Asset/icons/settings/1.png")),
                            SizedBox(width: 10,),
                            ReusableText(
                              title: 'Members',
                              size: 12,
                              weight: FontWeight.w500,
                              color:Color(0xff485470),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        ReusableText(
                          title: '36k',
                          size: 34,
                          weight: FontWeight.w700,
                          color:Color(0xff212121),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Container(

                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff2BB826))
                                  ,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(
                                child: Icon(Icons.upload,color: Color(0xff2BB826),),
                              ),
                            ),
                            SizedBox(width: 10,),
                            ReusableText(
                              title: '2.5 %',
                              size: 18,
                              weight: FontWeight.w500,
                              color:Color(0xff2BB826),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              SizedBox(
                  height: 160,
                  child: VerticalDivider(thickness: 2,width: 2,color: Color(0xffC8D1E5),)),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image(image: AssetImage("Asset/icons/settings/2.png")),
                            SizedBox(width: 10,),
                            ReusableText(
                              title: 'Followers',
                              size: 12,
                              weight: FontWeight.w500,
                              color:Color(0xff485470),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        ReusableText(
                          title: '124',
                          size: 34,
                          weight: FontWeight.w700,
                          color:Color(0xff212121),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Container(

                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff2BB826))
                                  ,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(
                                child: Icon(Icons.upload,color: Color(0xff2BB826),),
                              ),
                            ),
                            SizedBox(width: 10,),
                            ReusableText(
                              title: '2.5 %',
                              size: 18,
                              weight: FontWeight.w500,
                              color:Color(0xff2BB826),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 25,),
            ],
          ),
        ),
        SizedBox(height: 15,),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12) ,
              color: Color(0xffFFFFFF),
              border: Border.all(color: Color(0xffC8D1E5))
          ),
          child: Row(
            children: [
              SizedBox(width: 25,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image(image: AssetImage("Asset/icons/settings/3.png")),
                            SizedBox(width: 10,),
                            ReusableText(
                              title: 'Posts',
                              size: 12,
                              weight: FontWeight.w500,
                              color:Color(0xff485470),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        ReusableText(
                          title: '37',
                          size: 34,
                          weight: FontWeight.w700,
                          color:Color(0xff212121),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Container(

                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffB82626))
                                  ,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(
                                child: Icon(Icons.download,color: Color(0xffB82626),),
                              ),
                            ),
                            SizedBox(width: 10,),
                            ReusableText(
                              title: '2.5 %',
                              size: 18,
                              weight: FontWeight.w500,
                              color:Color(0xffB82626),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              SizedBox(
                  height: 160,
                  child: VerticalDivider(thickness: 2,width: 2,color: Color(0xffC8D1E5),)),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image(image: AssetImage("Asset/icons/settings/4.png")),
                            SizedBox(width: 10,),
                            ReusableText(
                              title: 'Likes',
                              size: 12,
                              weight: FontWeight.w500,
                              color:Color(0xff485470),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        ReusableText(
                          title: '6.5k',
                          size: 34,
                          weight: FontWeight.w700,
                          color:Color(0xff212121),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Container(

                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff2BB826))
                                  ,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(
                                child: Icon(Icons.upload,color: Color(0xff2BB826),),
                              ),
                            ),
                            SizedBox(width: 10,),
                            ReusableText(
                              title: '2.5 %',
                              size: 18,
                              weight: FontWeight.w500,
                              color:Color(0xff2BB826),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(width: 25,),
            ],
          ),
        ),
        SizedBox(height: 15,),
        Divider(thickness: 6,height: 6,color: Color(0xffF1F4FB),),
        SizedBox(height: 15,),
        Row(
          children: [
            ReusableText(
              title: 'Marketing Performance',
              size: 17,
              weight: FontWeight.w700,
              color: Color(0xff212121),
            ),
            Spacer(),
            Container(
              width: 101,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xffC8D1E5)),
                  color: Color(0xffF1F4FB)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ReusableText(
                    title: 'Weekly',
                    size: 13,
                    weight: FontWeight.w600,
                    color: Color(0xff485470),
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.keyboard_arrow_down_sharp,color: Color(0xff99A7C7),),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15,),
        SizedBox(
          width: MediaQuery.of(context).size.width*1,
          child: Image(
              fit: BoxFit.cover,
              image: AssetImage("Asset/images/setting/g1.png")),
        ),
        SizedBox(height: 15,),
        SizedBox(
          width: MediaQuery.of(context).size.width*1,
          child: Image(
              fit: BoxFit.cover,
              image: AssetImage("Asset/images/setting/g2.png")),
        ),
        SizedBox(height: 15,),
        SizedBox(
          width: MediaQuery.of(context).size.width*1,
          child: Image(
              fit: BoxFit.cover,
              image: AssetImage("Asset/images/setting/g3.png")),
        ),
        SizedBox(height: 15,),
        SizedBox(
          width: MediaQuery.of(context).size.width*1,
          child: Image(
              fit: BoxFit.cover,
              image: AssetImage("Asset/images/setting/g4.png")),
        ),
        SizedBox(height: 15,),
      ],
    );
  }
}
