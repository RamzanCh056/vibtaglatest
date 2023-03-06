import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/my_sugested.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/chat/chat_profile.dart';
import 'package:vibetag/screens/page/add_page.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  TextEditingController name = TextEditingController();
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
                Column(
                  children: [
                    NavBar(),
                    Header(
                      
                    ),
                  ],
                ),
                Container(
                  height: height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width * 0.95,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: borderRadius(10),
                          ),
                          padding: spacing(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: spacing(
                                  vertical: 5,
                                ),
                                child: InputField(
                                  hintText: 'Name',
                                  controller: name,
                                  haveTitle: false,
                                  background: '#F0F0F0',
                                ),
                              ),
                              Container(
                                margin: spacing(
                                  vertical: 5,
                                ),
                                child: InputField(
                                  hintText: 'Location',
                                  controller: name,
                                  haveTitle: false,
                                  background: '#F0F0F0',
                                ),
                              ),
                              Container(
                                margin: spacing(
                                  vertical: 5,
                                ),
                                child: InputField(
                                  hintText: 'When this event will starts?',
                                  controller: name,
                                  haveTitle: false,
                                  background: '#F0F0F0',
                                ),
                              ),
                              Container(
                                margin: spacing(
                                  vertical: 5,
                                ),
                                child: InputField(
                                  hintText: '',
                                  controller: name,
                                  haveTitle: false,
                                  background: '#F0F0F0',
                                ),
                              ),
                              Container(
                                margin: spacing(
                                  vertical: 5,
                                ),
                                child: InputField(
                                  hintText: 'When this event will ends?',
                                  controller: name,
                                  haveTitle: false,
                                  background: '#F0F0F0',
                                ),
                              ),
                              Container(
                                margin: spacing(
                                  vertical: 5,
                                ),
                                child: InputField(
                                  hintText: '',
                                  controller: name,
                                  haveTitle: false,
                                  background: '#F0F0F0',
                                ),
                              ),
                              Container(
                                margin: spacing(
                                  vertical: 5,
                                ),
                                child: InputField(
                                  hintText: 'Description',
                                  controller: name,
                                  haveTitle: false,
                                  background: '#F0F0F0',
                                  maxLine: 10,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
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
                                      bottom: height * 0.06,
                                      left: 0,
                                      right: 0,
                                      child: Text(
                                        'Select Photo and Video',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: white,
                                          fontSize: textSm,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: height * 0.09,
                                      left: 0,
                                      right: 0,
                                      child: Icon(
                                        Icons.photo,
                                        color: white,
                                        size: 50,
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 10,
                                      child: Text(
                                        'Image',
                                        style: TextStyle(
                                          fontSize: textMed,
                                          color: darkGray,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
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
                                            color: accent,
                                          ),
                                          Text(
                                            'Go Back',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: accent,
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
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
