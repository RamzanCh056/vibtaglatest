import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../stripe/stripe_payment.dart';
class MonthlyPlan extends StatefulWidget {
  const MonthlyPlan({Key? key}) : super(key: key);

  @override
  State<MonthlyPlan> createState() => _MonthlyPlanState();
}

class _MonthlyPlanState extends State<MonthlyPlan> {
  final List<String> imgList = [
    'assets/svgs/scrolOne.jpg',
    'assets/svgs/scrolOne.jpg',
  ];
  final List<String> name = [
    'Make\n Payment',
    'Request\n Maintenance',
  ];
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body:  Container(
        alignment: Alignment.center,
          child: CarouselSlider.builder(
            itemCount: 1,
            options: CarouselOptions(
              aspectRatio: 0.9,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
            ),
            itemBuilder: (ctx, index, realIdx) {
              return Card(
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                   color: Colors.white,

                  ),
                  width:double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      SizedBox(height: 3,),
                      Image.asset("assets/new/svg/bottom_drawer/booster.png", height: 30,),
                      SizedBox(height: 2,),
                      Text("Basic"),
                        SizedBox(height: 2,),
                        Divider(color: Colors.grey,),
                        SizedBox(height: 2,),
                        Text("3\$/ one day", style: TextStyle(fontSize: 18),),
                        SizedBox(height: 2,),
                        Text("Basic features for up to 10 employees with everything you need.", style: TextStyle(fontSize: 10),),
                        SizedBox(height: 8,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                          },
                          child: Container(
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffFF9200),

                            ),
                            width: double.infinity,

                            child: Center(
                              child: Text("Get Started", style: TextStyle(color: Colors.white, fontSize: 14),),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),

                        Row(children: [
                          CircleAvatar(
                              radius: 13,
                              backgroundColor: Color(0xff54D1B1),

                              child: Icon(Icons.done, color: Colors.white,)
                          ),
                          SizedBox(width: 10,),
                          Text("Featured member", style: TextStyle( fontSize: 12),),

                        ],),
                        SizedBox(height: 5,),
                        Row(children: [
                          CircleAvatar(
                              radius: 13,
                              backgroundColor: Color(0xff54D1B1),

                              child: Icon(Icons.done, color: Colors.white,)
                          ),
                          SizedBox(width: 10,),
                          Text("See profile visitors", style: TextStyle( fontSize: 12),),

                        ],),
                        SizedBox(height: 5,),
                        Row(children: [
                          CircleAvatar(
                              radius: 13,
                              backgroundColor: Color(0xff54D1B1),

                              child: Icon(Icons.done, color: Colors.white,)
                          ),
                          SizedBox(width: 10,),
                          Text("Show / Hide last seen", style: TextStyle( fontSize: 12),),

                        ],),
                        SizedBox(height: 5,),
                        Row(children: [
                          CircleAvatar(
                              radius: 13,
                              backgroundColor: Color(0xff54D1B1),

                              child: Icon(Icons.done, color: Colors.white,)
                          ),
                          SizedBox(width: 10,),
                          Text("01 Posts promotion", style: TextStyle( fontSize: 12),),

                        ],),
                        SizedBox(height: 5,),
                        Row(children: [
                          CircleAvatar(
                              radius: 13,
                              backgroundColor: Color(0xffFFC7C7),

                              child: Icon(Icons.close, color: Color(0xffE50000))
                          ),
                          SizedBox(width: 10,),
                          Text("No Pages promotion", style: TextStyle( fontSize: 12),),

                        ],),
                        SizedBox(height: 5,),
                        Row(children: [
                          CircleAvatar(
                              radius: 13,
                              backgroundColor: Color(0xffFFC7C7),

                              child: Icon(Icons.close, color: Color(0xffE50000))
                          ),
                          SizedBox(width: 10,),
                          Text("No Discount", style: TextStyle( fontSize: 12),),

                        ],),




                      ],),
                  ),
                ),
              );
            },
          )),

    );
  }



}
