import 'package:flutter/material.dart';
import 'package:vibetag/screens/help_support/support_widgets.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import '../../utils/constant.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<String> pageText = [
    'VibeTag Features',
    'Manage your Account',
    'Security, policy & safety',
    'Market place',
  ];

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      drawer: DrawerMenu(),
      backgroundColor: backgroundColor,
      key: _key,
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(
                    
                    ),
                  ],
                ),
                Container(
                  height: height * 0.81,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: width,
                          padding: spacing(
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              Container(
                                child: const Icon(
                                  Icons.home,
                                ),
                              ),
                              Container(
                                width: width * 0.85,
                                height: height * 0.07,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      alignment: Alignment.center,
                                      padding: spacing(
                                        horizontal: 15,
                                      ),
                                      child: Text(
                                        pageText[i],
                                        style: TextStyle(
                                          color: accent,
                                          fontSize: 12,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: width,
                          height: height * 0.2,
                          decoration: BoxDecoration(
                            color: orange,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: height * 0.02,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    width: width * 0.85,
                                    height: height * 0.05,
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: borderRadius(width),
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Search articles...',
                                        contentPadding: const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                        ),
                                        suffix: Icon(
                                          Icons.search,
                                          size: 14,
                                          color: orange,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: height * 0.08,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    width: width * 0.8,
                                    child: Text(
                                      'What can we Help you with?',
                                      style: TextStyle(
                                        color: white,
                                        fontSize: textXXl,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          padding: spacing(
                            horizontal: 10,
                          ),
                          alignment: Alignment.topLeft,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Popular Topics',
                                  style: TextStyle(
                                    fontSize: textSm,
                                  ),
                                ),
                                SupportBlock(
                                  height: height,
                                  icon: Icons.person_add,
                                  title: 'Account Setting',
                                ),
                                SupportBlock(
                                  height: height,
                                  icon: Icons.login,
                                  title: 'Login and Password',
                                ),
                                SupportBlock(
                                  height: height,
                                  icon: Icons.send,
                                  title: 'Messaging Help',
                                ),
                                SupportBlock(
                                  height: height,
                                  icon: Icons.photo,
                                  title: 'Sharing photo and Videos',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Discover Articles',
                                  style: TextStyle(
                                    fontSize: textSm,
                                  ),
                                ),
                                Card(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: medGray,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              )),
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.phone,
                                                size: iconMed,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Vibetage Features',
                                                style: TextStyle(
                                                  fontSize: textMed,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 1,
                                                color: darkGray,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Sharing Photo & Videos',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 1,
                                                color: darkGray,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Messaging',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Moments',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding: spacing(
                                            horizontal: 15,
                                            vertical: 7,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                            ),
                                            borderRadius: borderRadius(5),
                                          ),
                                          child: Text('See all articles'),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Card(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: medGray,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              )),
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.settings,
                                                size: iconMed,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Manage your Account',
                                                style: TextStyle(
                                                  fontSize: textMed,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 1,
                                                color: darkGray,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Sharing Photo & Videos',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 1,
                                                color: darkGray,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Messaging',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Moments',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding: spacing(
                                            horizontal: 15,
                                            vertical: 7,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                            ),
                                            borderRadius: borderRadius(5),
                                          ),
                                          child: Text('See all articles'),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Card(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: medGray,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              )),
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.security,
                                                size: iconMed,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Security, Privacy and Safety',
                                                style: TextStyle(
                                                  fontSize: textMed,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 1,
                                                color: darkGray,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Sharing Photo & Videos',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 1,
                                                color: darkGray,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Messaging',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Moments',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding: spacing(
                                            horizontal: 15,
                                            vertical: 7,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                            ),
                                            borderRadius: borderRadius(5),
                                          ),
                                          child: Text('See all articles'),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Card(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: medGray,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              )),
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.shopping_cart,
                                                size: iconMed,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Market Place',
                                                style: TextStyle(
                                                  fontSize: textMed,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 1,
                                                color: darkGray,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Sharing Photo & Videos',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 1,
                                                color: darkGray,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Messaging',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Moments',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding: spacing(
                                            horizontal: 15,
                                            vertical: 7,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                            ),
                                            borderRadius: borderRadius(5),
                                          ),
                                          child: Text('See all articles'),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Card(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: medGray,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              )),
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.policy_sharp,
                                                size: iconMed,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Rules and Polices',
                                                style: TextStyle(
                                                  fontSize: textMed,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 1,
                                                color: darkGray,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Sharing Photo & Videos',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 1,
                                                color: darkGray,
                                              ),
                                            ),
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Messaging',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          padding: spacing(
                                            horizontal: 10,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white,
                                          ),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Moments',
                                            style: TextStyle(
                                              color: orange,
                                              fontSize: textSm,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding: spacing(
                                            horizontal: 15,
                                            vertical: 7,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                            ),
                                            borderRadius: borderRadius(5),
                                          ),
                                          child: Text('See all articles'),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Card(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    height: height * 0.6,
                                    width: double.maxFinite,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: height * 0.05,
                                          left: 20,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Still need help?',
                                                style: TextStyle(
                                                  fontSize: textXXl,
                                                  color: accent,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Still need help?',
                                                style: TextStyle(
                                                  fontSize: textMed,
                                                  color: accent,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                padding: spacing(
                                                  horizontal: 25,
                                                  vertical: 7,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: orange,
                                                  borderRadius: borderRadius(5),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Write to us',
                                                    style: TextStyle(
                                                      color: white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          bottom: height * 0.05,
                                          left: 0,
                                          right: 0,
                                          child: Center(
                                            child: Container(
                                              width: width * 0.7,
                                              child: Image.asset(
                                                'assets/images/compaign/illustration.png',
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
