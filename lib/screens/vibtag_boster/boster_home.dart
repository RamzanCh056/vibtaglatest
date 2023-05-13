import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/constant.dart';
import '../header/header.dart';
import '../../widgets/navbar.dart';
import '../drawer/drawer.dart';
import 'monthly_plan.dart';
class BoosterHome extends StatefulWidget {
  const BoosterHome({Key? key}) : super(key: key);

  @override
  State<BoosterHome> createState() => _BoosterHomeState();
}

class _BoosterHomeState extends State<BoosterHome> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        key: key,
        //backgroundColor: HexColor('#F1F4FB'),
        drawer: DrawerMenu(),
        body: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  const NavBar(),
                  Header(
                
                  ),
                ],
              ),
            SizedBox(height: 5,),
            Container(
              color: Color(0xffFF9200),
              height: 100, width: double.infinity,

              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  Text("VibeTag Booster", style: TextStyle(color: Colors.white, fontSize: 18),),
                  Text("Boost Features allows you to explore all amazing tools over your vibes.", style: TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,

                  )


                ],),
              ),

            ),
              SizedBox(height: 5,),

              Column(
                children: [
                  Text("Pricing Plan", style: TextStyle(color: Color(0xffFF9200), fontSize: 16),),
                  SizedBox(height: 3,),
                  Text("Choose Your Pricing Plan", style: TextStyle(color: Colors.black, fontSize: 14),),

                  SizedBox(height: 2,),
                  Container(
                      color: const Color(0xFFF1F4FB),
                    width: 330,

                    child: Column(
                      children: [
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = 0;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                  // border: Border.all(
                                  //
                                  // ),
                                  borderRadius: BorderRadius.circular(5),
                                  color: currentIndex == 0 ?   Colors.white: Colors.transparent,
                                ),
                                child: Center(
                                  child: Text(
                                    'Monthly Plan',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: currentIndex == 0 ? const Color(0xff7D8CAC) : const Color(0xff7D8CAC)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = 1;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:  currentIndex == 1 ?   Colors.white: Colors.transparent,
                                ),
                                child: Center(
                                  child: Text(
                                    'Annual Plan',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: currentIndex == 1 ? const Color(0xff7D8CAC) : const Color(0xff7D8CAC)),
                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),
                        SizedBox(height: 5,),

                      ],
                    ),



                  ),








              ],),

              const SizedBox(
                height: 5,
              ),

              currentIndex == 0?  Expanded(child: MonthlyPlan()):Container(),
              currentIndex == 1?   Container():Container(),
              SizedBox(height: 10,),

              const SizedBox(
                height: 5,
              ),

            ],
          ),
        ),
      )
    );
  }
}
