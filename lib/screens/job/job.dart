import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/album/all_albums.dart';
import 'package:vibetag/screens/album/create_album.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/screens/shop/drop_down_list.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../drawer/shop_drawer.dart';
import '../shop/shop_header.dart';

class Job extends StatefulWidget {
  const Job({super.key});

  @override
  State<Job> createState() => _JobState();
}

class _JobState extends State<Job> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    List<String> buttenText = [
      'Full Time',
      'Part Time',
      'Internship',
      'Volunteer',
      'Contract',
    ];
    List<String> skills = [
      'Skill A',
      'Skill B',
      'Skill C',
      'Skill D',
      'Skill E',
      'Skill F',
    ];
    return Scaffold(
      key: key,
      backgroundColor: backgroundColor,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    const NavBar(),
                    Header(
                      onTap: () {
                        key.currentState!.openDrawer();
                      },
                    ),
                  ],
                ),
                Container(
                  width: width * 0.95,
                  height: height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: white, borderRadius: borderRadius(10)),
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              Container(
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 0,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Nearby Business',
                                      style: TextStyle(
                                        color: orange,
                                        fontSize: textSm,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: width * 0.6,
                                      child: Text(
                                        'Find businesses near to you based on your location and connect with them directly',
                                        style: TextStyle(
                                          color: accent,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding: spacing(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                          color: orange,
                                          borderRadius: borderRadius(5)),
                                      child: Text(
                                        'Explore',
                                        style: TextStyle(
                                          color: white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: width * 0.25,
                                child: Image.asset(
                                  'assets/images/job.png',
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: spacing(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          margin: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: borderRadius(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width * 0.1,
                                    height: width * 0.1,
                                    padding: spacing(
                                      horizontal: 7,
                                      vertical: 7,
                                    ),
                                    decoration: BoxDecoration(
                                      color: orange,
                                      borderRadius: borderRadius(width * 0.1),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/svg/post/briefcase.svg',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Jobs',
                                    style: TextStyle(
                                      color: orange,
                                      fontSize: textXl,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: width * 0.1,
                                    height: width * 0.1,
                                    padding: spacing(
                                      horizontal: 7,
                                      vertical: 7,
                                    ),
                                    decoration: BoxDecoration(
                                      color: lightGray,
                                      borderRadius: borderRadius(width * 0.1),
                                    ),
                                    child: Icon(
                                      Icons.location_pin,
                                      color: orange,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: height * 0.05,
                                    padding: spacing(
                                      horizontal: 7,
                                      vertical: 7,
                                    ),
                                    decoration: BoxDecoration(
                                      color: lightGray,
                                      borderRadius: borderRadius(width * 0.1),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width * 0.5,
                                          child: TextFormField(
                                            controller: search,
                                            decoration: const InputDecoration(
                                              hintText: 'search job',
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(
                                                bottom: 10,
                                                left: 10,
                                                right: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.maxFinite,
                                height: height * 0.1,
                                child: GridView.builder(
                                  itemCount: 5,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 10,
                                          childAspectRatio: 3 / 1),
                                  itemBuilder: (context, i) {
                                    return Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: i > 0 ? darkGray : orange,
                                        ),
                                        borderRadius: borderRadius(15),
                                      ),
                                      child: Text(
                                        buttenText[i],
                                        style: TextStyle(
                                          color: i > 0 ? darkGray : orange,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: spacing(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          margin: spacing(
                            horizontal: 0,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: borderRadius(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: double.maxFinite,
                                height: height * 0.1,
                                child: ListTile(
                                  leading: Container(
                                    width: width * 0.1,
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      backgroundColor: darkGray,
                                      radius: width * 0.05,
                                    ),
                                  ),
                                  title: Text(
                                    'Company Name',
                                    style: TextStyle(
                                      color: accent,
                                    ),
                                  ),
                                  subtitle: const Text(
                                    'Place of company',
                                  ),
                                ),
                              ),
                              Container(
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 0,
                                ),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Job title',
                                  style: TextStyle(
                                    color: accent,
                                    fontSize: textMed,
                                  ),
                                ),
                              ),
                              Container(
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 0,
                                ),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Description',
                                  style: TextStyle(
                                    color: darkGray,
                                    fontSize: textXSm,
                                  ),
                                ),
                              ),
                              Container(
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 0,
                                ),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown ...',
                                  style: TextStyle(
                                    color: primaryGray,
                                    fontSize: textXSm,
                                  ),
                                ),
                              ),
                              Container(
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 0,
                                ),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Required Education',
                                  style: TextStyle(
                                    color: darkGray,
                                    fontSize: textXSm,
                                  ),
                                ),
                              ),
                              Container(
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 0,
                                ),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print.',
                                  style: TextStyle(
                                    color: primaryGray,
                                    fontSize: textXSm,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 0,
                                ),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Required skills',
                                  style: TextStyle(
                                    color: darkGray,
                                    fontSize: textXSm,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.maxFinite,
                                height: height * 0.1,
                                child: GridView.builder(
                                  itemCount: 6,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 10,
                                          childAspectRatio: 3 / 1),
                                  itemBuilder: (context, i) {
                                    return Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: darkGray,
                                        ),
                                        borderRadius: borderRadius(15),
                                      ),
                                      child: Text(
                                        skills[i],
                                        style: TextStyle(
                                          color: darkGray,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SecondaryFooter(),
                const AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
