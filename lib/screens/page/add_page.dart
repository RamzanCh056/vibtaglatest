import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

class AddNewPag extends StatefulWidget {
  const AddNewPag({super.key});

  @override
  State<AddNewPag> createState() => _AddNewPagState();
}

class _AddNewPagState extends State<AddNewPag> {
  TextEditingController pageName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(
                      onTap: () {},
                    ),
                  ],
                ),
                ///////////
                Container(
                  height: height * 0.87,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.9,
                          margin: spacing(
                            horizontal: width * 0.05,
                            vertical: height * 0.02,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: borderRadius(
                              10,
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Start Your Business Page',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: width,
                                height: height * 0.25,
                                color: HexColor('#E0E0E0'),
                              ),
                              Container(
                                width: width,
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 0,
                                ),
                                height: height * 0.06,
                                color: HexColor('#000000'),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.edit_calendar_sharp,
                                          color: Colors.orange,
                                          size: 32,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(
                                            top: 3,
                                          ),
                                          child: Text(
                                            'Create Page',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.keyboard_arrow_left_outlined,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 3,
                                          ),
                                          child: const Text(
                                            'My Page',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: width * 0.8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Page Name',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: height * 0.06,
                                      decoration: BoxDecoration(
                                        color: HexColor('#E0E0E0'),
                                        borderRadius: borderRadius(10),
                                      ),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                            top: 0,
                                            left: 10,
                                            bottom: 0,
                                          ),
                                          hintText: 'Name',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: width * 0.8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Page Url',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: HexColor('#E0E0E0'),
                                        borderRadius: borderRadius(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: height * 0.06,
                                            width: width * 0.45,
                                            decoration: BoxDecoration(
                                              color: HexColor('#E0E0E0'),
                                              borderRadius: borderRadius(10),
                                            ),
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                  top: 0,
                                                  left: 10,
                                                  bottom: 0,
                                                ),
                                                hintText: 'Location',
                                                border: InputBorder.none,
                                              ),
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
                                              'Create Link ID',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: width * 0.8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Page Category',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: height * 0.06,
                                      decoration: BoxDecoration(
                                        color: HexColor('#E0E0E0'),
                                        borderRadius: borderRadius(10),
                                      ),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                            top: 0,
                                            left: 10,
                                            bottom: 0,
                                          ),
                                          hintText:
                                              'When this event will start?',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: width * 0.8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Page Description',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: height * 0.2,
                                      decoration: BoxDecoration(
                                        color: HexColor('#E0E0E0'),
                                        borderRadius: borderRadius(10),
                                      ),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                            left: 10,
                                          ),
                                          hintText: 'Description here...',
                                          border: InputBorder.none,
                                        ),
                                        maxLength: 4,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              Container(
                                width: width * 0.8,
                                child: Text(
                                  'Your page description, between 10 to 200 characters max.',
                                  style: TextStyle(
                                    color: HexColor('#E0E0E0'),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: width * 0.8,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.keyboard_arrow_left_outlined,
                                          size: 32,
                                        ),
                                        Text(
                                          'Go Back',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
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
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        SecondaryFooter(),
                        AppFooter(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
