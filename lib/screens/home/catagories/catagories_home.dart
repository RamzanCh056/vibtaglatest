import 'package:flutter/material.dart';
import 'package:vibetag/screens/home/catagories/society_catagire.dart';
import 'package:vibetag/screens/home/catagories/tv_programe.dart';

import 'explore_catagorie.dart';
import 'leisure_catagorie.dart';
import 'life_style.dart';
import 'music_catagorie.dart';
class CatagoriesHome extends StatefulWidget {
  const CatagoriesHome({Key? key}) : super(key: key);

  @override
  State<CatagoriesHome> createState() => _CatagoriesHomeState();
}

class _CatagoriesHomeState extends State<CatagoriesHome> {
  int tabIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Catagories",
          ),
          centerTitle: true,
        ),
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          tabIndex = 1;
                        });
                      },
                      child: Container(
                        height: 44,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: (BorderRadius.circular(20)),
                          color: tabIndex == 1 ? kAppColor : kTabOffColor,
                        ),
                        child: Center(
                          child: Text(
                            "Explore",
                            style: TextStyle(color: tabIndex == 1 ? kWhiteColor : kBlackColor, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          tabIndex = 2;
                        });
                      },
                      child: Container(
                        height: 44,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: (BorderRadius.circular(20)),
                          color: tabIndex == 2 ? kAppColor : kTabOffColor,
                        ),
                        child: Center(
                          child: Text(
                            "Leisure",
                            style: TextStyle(color: tabIndex == 2 ? kWhiteColor : kBlackColor, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          tabIndex = 3;
                        });
                      },
                      child: Container(
                        height: 44,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: (BorderRadius.circular(20)),
                          color: tabIndex == 3 ? kAppColor : kTabOffColor,
                        ),
                        child: Center(
                          child: Text(
                            "Lifestyle",
                            style: TextStyle(color: tabIndex == 3 ? kWhiteColor : kBlackColor, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 10,),
              Row(children: [
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        tabIndex = 4;
                      });
                    },
                    child: Container(
                      height: 44,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: (BorderRadius.circular(20)),
                        color: tabIndex == 4 ? kAppColor : kTabOffColor,
                      ),
                      child: Center(
                        child: Text(
                          "Music",
                          style: TextStyle(color: tabIndex == 4 ? kWhiteColor : kBlackColor, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        tabIndex = 5;
                      });
                    },
                    child: Container(
                      height: 44,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: (BorderRadius.circular(20)),
                        color: tabIndex == 5 ? kAppColor : kTabOffColor,
                      ),
                      child: Center(
                        child: Text(
                          "TVPrograms",
                          style: TextStyle(color: tabIndex == 5 ? kWhiteColor : kBlackColor, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        tabIndex = 6;
                      });
                    },
                    child: Container(
                      height: 44,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: (BorderRadius.circular(20)),
                        color: tabIndex == 6 ? kAppColor : kTabOffColor,
                      ),
                      child: Center(
                        child: Text(
                          "Society",
                          style: TextStyle(color: tabIndex == 6 ? kWhiteColor : kBlackColor, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                )
              ],),


              tabIndex == 1 ?  const Expanded(child: ExploreCatagroiers()) : Container(),
              tabIndex == 2 ?  const Expanded(child: LeisureCatagroiers()) : Container(),
              tabIndex == 3 ?  const Expanded(child: LifeStyleCatagroiers ()) : Container(),
              tabIndex == 4 ?  const Expanded(child: MusicCatagroiers ()) : Container(),
              tabIndex == 5 ?  const Expanded(child: TvCatagroiers ()) : Container(),
              tabIndex == 6 ?  const Expanded(child: SocietyCatagroiers ()) : Container(),



            ],
          ),
        ),
      )
    );

  }

}
Color kGreyColor = Colors.grey;
Color kTabOffColor = const Color(0xff97999B);
const Color  kAppColor = Color(0xffFF9200);
Color kSkipColor = const Color(0xff989898);
Color kFillColor = const Color(0xFFF8F8F8);
Color kBlueColor = const Color(0xff0C98FF);
Color kCardColor = const Color(0xff7E57C2);
Color kRedColor = const Color(0xffBA0F30);
Color kRedIconColor = const Color(0xffF95B5A);
Color kGreenColor = const Color(0xff2DBE60);
Color kBlackColor = Colors.black;
const Color kWhiteColor = Colors.white;
Color? kTabColor = Colors.purple[900];
