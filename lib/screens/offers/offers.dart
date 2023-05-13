import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:vibetag/widgets/footer.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';

import 'package:vibetag/widgets/secondary_footer.dart';

import '../../utils/constant.dart';

class Offer extends StatefulWidget {
  const Offer({super.key});

  @override
  State<Offer> createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      drawer: DrawerMenu(),
      key: _key,
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    NavBar(),
                    Header(
                     
                    )
                  ],
                ),
                Container(
                  width: width * 0.9,
                  height: height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: width * 0.95,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Offer lists',
                                style: TextStyle(
                                  fontSize: textMed,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Find offer list and details',
                                style: TextStyle(
                                  fontSize: textXSm,
                                  color: darkGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: width * 0.95,
                          height: height * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: spacing(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: borderRadius(50),
                                ),
                                child: SvgPicture.asset(
                                  'assets/svg/price-tag.svg',
                                  width: width * 0.2,
                                  color: darkGray,
                                ),
                              ),
                              Container(
                                padding: spacing(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                child: Text(
                                  'No available offers',
                                  style: TextStyle(
                                    color: darkGray,
                                    fontSize: textMed,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
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
