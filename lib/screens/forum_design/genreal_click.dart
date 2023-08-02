import 'package:flutter/material.dart';

import '../register/reusabletext.dart';
import 'fitness_in_gym_click.dart';

class GenerallClicks extends StatefulWidget {
  const GenerallClicks({Key? key}) : super(key: key);

  @override
  State<GenerallClicks> createState() => _GenerallClicksState();
}

class _GenerallClicksState extends State<GenerallClicks> {
  bool _isVisible = false;
  bool _isVisible1 =false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*1,
      padding: EdgeInsets.all(0),
      color: Color(0xffF1F4FB),
      child: ListView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(10),
            height: 80,color: Color(0xff7D8CAC),child: Row(
            children: [
              ReusableText(title: 'Health & Wellness',size: 16,weight: FontWeight.w700,color: Color(0xffFFFFFF),),
              Spacer(),
              IconButton(icon: Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xffFFFFFF),),onPressed: (){
                setState(() {
                  _isVisible1=!_isVisible1;
                });
              },),
            ],
          ),
          ),
          SizedBox(height: 10,),
          Visibility(
            visible: _isVisible1,
            child: InkWell(
              onTap: (){
                setState(() {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>FitnessIngym()) );
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
                          Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xff5A8CFF),
                          ),
                          child: Center(child:Image(image: AssetImage("Asset/icons/form/Group.png"),),),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              ReusableText(title: 'Topic',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                              SizedBox(height: 10,),
                              ReusableText(title: '235',size: 16,weight: FontWeight.w700,color: Color(0xff485470),),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              ReusableText(title: 'Posts',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                              SizedBox(height: 10,),
                              ReusableText(title: '534',size: 16,weight: FontWeight.w700,color: Color(0xff485470),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      ReusableText(title: 'Fitness in Gym',size: 13,weight: FontWeight.w700,color: Color(0xff485470),),
                      SizedBox(height: 10,)
,                  ReusableText(title: 'Exercise and Nutrition for Optimal Fitness" - This topic\nemphasizes the importance of regular exercise and\nhealthy...',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                      SizedBox(height: 10,),
                      Divider(thickness: 2,color: Color(0xffF1F4FB),height:2,),
                      SizedBox(height: 10,),
                      ListTile(
                        leading: Image(
                          height: 40,width: 40,
                          image: AssetImage("Asset/images/form/Group 1000004117.png"),),
                        title:                  ReusableText(title: 'What Training Should I Be Doing to Lose Weight?',size: 11,weight: FontWeight.w600,color: Color(0xff485470),),
                        subtitle:                   ReusableText(title: 'Last reply by mark_henry2, 13 minutes ago',size: 13,weight: FontWeight.w700,color: Color(0xff7D8CAC),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Visibility(
            visible: _isVisible1,
            child: InkWell(
              onTap: (){
                setState(() {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>FitnessIngym()) );
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
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xffFF5A8C),
                            ),
                            child: Center(child:Image(image: AssetImage("Asset/icons/form/Group.png"),),),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              ReusableText(title: 'Topic',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                              SizedBox(height: 10,),
                              ReusableText(title: '235',size: 16,weight: FontWeight.w700,color: Color(0xff485470),),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              ReusableText(title: 'Posts',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                              SizedBox(height: 10,),
                              ReusableText(title: '534',size: 16,weight: FontWeight.w700,color: Color(0xff485470),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      ReusableText(title: 'Fitness in Gym',size: 13,weight: FontWeight.w700,color: Color(0xff485470),),
                      SizedBox(height: 10,)
                      ,                  ReusableText(title: 'Exercise and Nutrition for Optimal Fitness" - This topic\nemphasizes the importance of regular exercise and\nhealthy...',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                      SizedBox(height: 10,),
                      Divider(thickness: 2,color: Color(0xffF1F4FB),height:2,),
                      SizedBox(height: 10,),
                      ListTile(
                        leading: Image(
                          height: 40,width: 40,
                          image: AssetImage("Asset/images/form/Group 1000004117.png"),),
                        title:                  ReusableText(title: 'What Training Should I Be Doing to Lose Weight?',size: 11,weight: FontWeight.w600,color: Color(0xff485470),),
                        subtitle:                   ReusableText(title: 'Last reply by mark_henry2, 13 minutes ago',size: 13,weight: FontWeight.w700,color: Color(0xff7D8CAC),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(10),
            height: 80,color: Color(0xff7D8CAC),child: Row(
            children: [
              ReusableText(title: 'The Gym Experience',size: 16,weight: FontWeight.w700,color: Color(0xffFFFFFF),),
              Spacer(),
              IconButton(icon: Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xffFFFFFF),),onPressed: (){
                setState(() {
                  _isVisible=!_isVisible;
                });
              },),
            ],
          ),
          ),
          SizedBox(height: 10,),
          Visibility(
            visible: _isVisible,
            child: InkWell(
              onTap: (){
                setState(() {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>FitnessIngym()) );
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
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xffC070FF),
                            ),
                            child: Center(child:Image(image: AssetImage("Asset/icons/form/Group.png"),),),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              ReusableText(title: 'Topic',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                              SizedBox(height: 10,),
                              ReusableText(title: '235',size: 16,weight: FontWeight.w700,color: Color(0xff485470),),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              ReusableText(title: 'Posts',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                              SizedBox(height: 10,),
                              ReusableText(title: '534',size: 16,weight: FontWeight.w700,color: Color(0xff485470),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      ReusableText(title: 'Fitness in Gym',size: 13,weight: FontWeight.w700,color: Color(0xff485470),),
                      SizedBox(height: 10,)
                      ,                  ReusableText(title: 'Exercise and Nutrition for Optimal Fitness" - This topic\nemphasizes the importance of regular exercise and\nhealthy...',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                      SizedBox(height: 10,),
                      Divider(thickness: 2,color: Color(0xffF1F4FB),height:2,),
                      SizedBox(height: 10,),
                      ListTile(
                        leading: Image(
                          height: 40,width: 40,
                          image: AssetImage("Asset/images/form/Group 1000004117.png"),),
                        title:                  ReusableText(title: 'What Training Should I Be Doing to Lose Weight?',size: 11,weight: FontWeight.w600,color: Color(0xff485470),),
                        subtitle:                   ReusableText(title: 'Last reply by mark_henry2, 13 minutes ago',size: 13,weight: FontWeight.w700,color: Color(0xff7D8CAC),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Visibility(
            visible: _isVisible,
            child: InkWell(
              onTap: (){
                setState(() {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>FitnessIngym()) );
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
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xff5A8CFF),
                            ),
                            child: Center(child:Image(image: AssetImage("Asset/icons/form/Group.png"),),),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              ReusableText(title: 'Topic',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                              SizedBox(height: 10,),
                              ReusableText(title: '235',size: 16,weight: FontWeight.w700,color: Color(0xff485470),),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              ReusableText(title: 'Posts',size: 13,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                              SizedBox(height: 10,),
                              ReusableText(title: '534',size: 16,weight: FontWeight.w700,color: Color(0xff485470),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      ReusableText(title: 'Fitness in Gym',size: 13,weight: FontWeight.w700,color: Color(0xff485470),),
                      SizedBox(height: 10,),
                      ReusableText(title: 'Exercise and Nutrition for Optimal Fitness" - This topic\nemphasizes the importance of regular exercise and\nhealthy...',size: 12,weight: FontWeight.w500,color: Color(0xff7D8CAC),),
                      SizedBox(height: 10,),
                      Divider(thickness: 2,color: Color(0xffF1F4FB),height:2,),
                      SizedBox(height: 10,),
                      ListTile(
                        leading: Image(
                          height: 40,width: 40,
                          image: AssetImage("Asset/images/form/Group 1000004117.png"),),
                        title: ReusableText(title: 'What Training Should I Be Doing to Lose Weight?',size: 11,weight: FontWeight.w600,color: Color(0xff485470),),
                        subtitle:ReusableText(title: 'Last reply by mark_henry2, 13 minutes ago',size: 13,weight: FontWeight.w700,color: Color(0xff7D8CAC),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
