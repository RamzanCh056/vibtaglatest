import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/groups/add_new_group.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/my_sugested.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/page/add_page.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

class CreateFunding extends StatefulWidget {
  const CreateFunding({super.key});

  @override
  State<CreateFunding> createState() => _CreateFundingState();
}

class _CreateFundingState extends State<CreateFunding> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: backgroundColor,
      key: _key,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(
                      onTap: () {
                        _key.currentState!.openDrawer();
                      },
                    )
                  ],
                ),
                Container(
                  height: height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.08,
                          width: width,
                          child: Card(
                            color: backgroundColor,
                            child: Padding(
                              padding: spacing(
                                horizontal: 10,
                                vertical: 0,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: spacing(
                                      horizontal: 0,
                                      vertical: 12,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Container(
                                                  width: width * 0.07,
                                                  height: width * 0.07,
                                                  padding: spacing(
                                                    horizontal: 5,
                                                    vertical: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: orange,
                                                    borderRadius:
                                                        borderRadius(20),
                                                  ),
                                                  child: SvgIcon(
                                                    'assets/svg/post/image1.svg',
                                                    width: width * 0.04,
                                                    color: white,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Create new funding request',
                                                style: TextStyle(
                                                  fontSize: textSm,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width * 0.95,
                          child: Column(
                            children: [
                              InputField(
                                title: 'Title',
                                hintText: 'Title here',
                                controller: title,
                                textColor: '#000000',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InputField(
                                title:
                                    'How many money you would like to receive?',
                                hintText: 'Title here',
                                controller: title,
                                textColor: '#000000',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InputField(
                                title: 'Description',
                                hintText: 'Write here',
                                controller: title,
                                textColor: '#000000',
                                maxLine: 10,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: width * 0.95,
                                child: Text(
                                  'Image',
                                  style: TextStyle(
                                    fontSize: textMed,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: height * 0.3,
                                width: width * 0.95,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      HexColor('#FFFFFF'),
                                      HexColor('#D2D2D2'),
                                    ],
                                    begin: const FractionalOffset(
                                      0.0,
                                      0.0,
                                    ),
                                    end: const FractionalOffset(
                                      0.0,
                                      0.8,
                                    ),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp,
                                  ),
                                  borderRadius: borderRadius(15),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 15,
                                      left: 0,
                                      right: 0,
                                      child: Text(
                                        'Drop Image Here or Browse to upload',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: white,
                                          fontSize: textSm,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 40,
                                      left: 0,
                                      right: 0,
                                      child: Icon(
                                        Icons.photo,
                                        color: white,
                                        size: 50,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: width * 0.9,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.keyboard_arrow_left_outlined,
                                            size: 32,
                                            color: blue,
                                          ),
                                          Text(
                                            'Go Back',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.06,
                                      width: width * 0.35,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: borderRadius(10),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Publish',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SecondaryFooter(),
                AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
