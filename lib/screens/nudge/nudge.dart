import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/screens/nudge/you_nudge.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'new_nudge.dart';

class Nudge extends StatefulWidget {
  const Nudge({super.key});

  @override
  State<Nudge> createState() => _NudgeState();
}

class _NudgeState extends State<Nudge> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      key: key,
      backgroundColor: HexColor('#F1F4FB'),
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: Column(
            children: [
              Column(
                children: [
                  const NavBar(),
                  Header(
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 130,
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //
                          // ),
                          borderRadius: BorderRadius.circular(50),
                          color: currentIndex == 0 ? const Color(0xffFFC107) : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'New Nudges',
                            style: TextStyle(
                                fontSize: 16,
                                color: currentIndex == 0 ? const Color(0xffFFFFFF) : const Color(0xff7D8CAC)),
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
                        height: 50,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: currentIndex == 1 ? const Color(0xffFFC107) : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'You Nudged',
                            style: TextStyle(
                                fontSize: 16,
                                color: currentIndex == 1 ? const Color(0xffFFFFFF) : const Color(0xff7D8CAC)),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(child: Text("")),
                    Container(
                        height: 45,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xffC8D1E5),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Center(
                          child: Icon(Icons.search, color: Colors.white),
                        ))
                  ],
                ),
              ),
              currentIndex == 0?  Expanded(child: NewNudge()):Container(),
              currentIndex == 1?  Expanded(child: YouNudge()):Container(),
              const SizedBox(
                height: 30,
              ),

            ],
          ),
        ),
      ),
    );
  }

}
