import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/funding/create_new_funding.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/bottom_modal_sheet_widget.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

class Funding extends StatefulWidget {
  const Funding({super.key});

  @override
  State<Funding> createState() => _FundingState();
}

class _FundingState extends State<Funding> {
  List<String> buttonText = [
    'Funding',
    'My Funding Requests',
    'Create new funding Request'
  ];
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.125,
                  child: Column(
                    children: [NavBar(), Header()],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: height * 0.05,
                      margin: spacing(vertical: 5),
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int i) {
                          if (i == 0) {
                            return Container(
                              padding: spacing(horizontal: 20, vertical: 7),
                              margin: spacing(horizontal: 5, vertical: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    HexColor('#FF9200'),
                                    HexColor('#FDBA31')
                                  ],
                                ),
                                borderRadius: borderRadius(width),
                              ),
                              child: Text(
                                buttonText[i],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: white,
                                ),
                              ),
                            );
                          }
                          if (i == 1) {
                            return Container(
                              padding: spacing(horizontal: 20, vertical: 7),
                              margin: spacing(horizontal: 5, vertical: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: borderRadius(width),
                              ),
                              child: Text(
                                buttonText[i],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: blackPrimary,
                                ),
                              ),
                            );
                          }
                          return InkWell(
                            onTap: () {
                              createBottomModalSheet(
                                context: context,
                                screen: CreateFundingRequest(),
                              );
                            },
                            child: Container(
                              padding: spacing(horizontal: 20, vertical: 7),
                              margin: spacing(horizontal: 5, vertical: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: orange,
                                ),
                                borderRadius: borderRadius(width),
                              ),
                              child: Text(
                                buttonText[i],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: orange,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: height * 0.85,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: spacing(vertical: 15),
                            margin: spacing(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: borderRadius(7),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  padding: spacing(horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: width * 0.05,
                                            foregroundImage: AssetImage(
                                              'assets/new/images/user.png',
                                            ),
                                          ),
                                          gap(w: 10),
                                          Column(
                                            children: [
                                              Text(
                                                'Microsoft',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                '1 day ago',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: grayMed,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SvgPicture.asset(
                                        'assets/new/svg/buzzin/more_h.svg',
                                        color: grayMed,
                                      )
                                    ],
                                  ),
                                ),
                                gap(h: 10),
                                Image.asset(
                                  'assets/images/streamer.jpg',
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  width: double.maxFinite,
                                  padding: spacing(
                                    horizontal: 10,
                                    vertical: 15,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'I am looking for some help',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: blackPrimary,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      gap(h: 5),
                                      Text(
                                        'Lorem Ipsum is simply dummy text of the printing and typesetting indus...Read more',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: grayMed,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      gap(h: 15),
                                      Container(
                                        height: 1,
                                        width: double.maxFinite,
                                        color: grayMed,
                                      ),
                                      gap(h: 15),
                                      Row(
                                        children: [
                                          Text(
                                            '\$293.41',
                                            style: TextStyle(
                                              color: grayMed,
                                            ),
                                          ),
                                          Text('/\$3000'),
                                        ],
                                      ),
                                      gap(h: 5),
                                      Container(
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: double.maxFinite,
                                              height: height * 0.02,
                                              decoration: BoxDecoration(
                                                color: grayLight,
                                                borderRadius:
                                                    borderRadius(width),
                                              ),
                                            ),
                                            Positioned(
                                              child: Container(
                                                width: width * 0.35,
                                                height: height * 0.02,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin:
                                                        Alignment.centerRight,
                                                    end: Alignment.centerLeft,
                                                    colors: [
                                                      HexColor('#FF9200'),
                                                      HexColor('#FDBA31')
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      borderRadius(width),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      gap(h: 15),
                                      Container(
                                        padding: spacing(
                                          horizontal: 15,
                                          vertical: 15,
                                        ),
                                        width: double.maxFinite,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: orangePrimary,
                                          ),
                                          borderRadius: borderRadius(15),
                                        ),
                                        child: Text(
                                          'Donate',
                                          style: TextStyle(
                                            color: orange,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
