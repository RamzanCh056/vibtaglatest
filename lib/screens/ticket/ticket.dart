import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';

import 'package:vibetag/widgets/footer.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../../utils/constant.dart';
import '../../widgets/custom_painter.dart';
import '../shop/cart.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      backgroundColor: backgroundColor,
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
                  width: width * 0.95,
                  height: height * 0.8,
                  margin: spacing(
                    vertical: 5,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.13,
                          width: double.maxFinite,
                          child: ClipRRect(
                            borderRadius: borderRadius(10),
                            child: Image.asset(
                              'assets/images/streamer.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Text(
                                  'Support Ticket',
                                  style: TextStyle(
                                    color: accent,
                                    fontSize: textMed,
                                  ),
                                ),
                              ),
                              Container(
                                padding: spacing(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: orange,
                                  borderRadius: borderRadius(5),
                                ),
                                child: Text(
                                  'More Options',
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: borderRadius(12),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Container(
                                  color: orange,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: orange,
                                        ),
                                        padding: spacing(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: Text(
                                          '#234fdqs3 Ticket',
                                          style: TextStyle(
                                            color: white,
                                            fontSize: textSm,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: spacing(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: Icon(
                                          Icons.more_horiz,
                                          color: white,
                                          size: iconMax,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.25,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'ID:',
                                        style: TextStyle(
                                          color: orange,
                                          fontSize: textSm,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.6,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        '46',
                                        style: TextStyle(
                                          color: primaryGray,
                                          fontSize: textMed,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.25,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'Date:',
                                        style: TextStyle(
                                          color: orange,
                                          fontSize: textSm,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.6,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        '2020-11-22 20:25',
                                        style: TextStyle(
                                          color: primaryGray,
                                          fontSize: textMed,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.25,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'Message:',
                                        style: TextStyle(
                                          color: orange,
                                          fontSize: textSm,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.6,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'Hi Sir,\n We \"VibeTag\" are here to solve your issues \n Thanks',
                                        style: TextStyle(
                                          color: primaryGray,
                                          fontSize: textMed,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.25,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'Support',
                                        style: TextStyle(
                                          color: orange,
                                          fontSize: textSm,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.6,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'Open',
                                        style: TextStyle(
                                          color: primaryGray,
                                          fontSize: textMed,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: borderRadius(12),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Container(
                                  color: orange,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: orange,
                                        ),
                                        padding: spacing(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: Text(
                                          '#56frst3 Ticket',
                                          style: TextStyle(
                                            color: white,
                                            fontSize: textSm,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: spacing(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: Icon(
                                          Icons.more_horiz,
                                          color: white,
                                          size: iconMax,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.25,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'ID:',
                                        style: TextStyle(
                                          color: orange,
                                          fontSize: textSm,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.6,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        '46',
                                        style: TextStyle(
                                          color: primaryGray,
                                          fontSize: textMed,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.25,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'Date:',
                                        style: TextStyle(
                                          color: orange,
                                          fontSize: textSm,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.6,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        '2020-11-22 20:25',
                                        style: TextStyle(
                                          color: primaryGray,
                                          fontSize: textMed,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.25,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'Message:',
                                        style: TextStyle(
                                          color: orange,
                                          fontSize: textSm,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.6,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'Hi Sir,\n We \"VibeTag\" are here to solve your issues \n Thanks',
                                        style: TextStyle(
                                          color: primaryGray,
                                          fontSize: textMed,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.25,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'Support',
                                        style: TextStyle(
                                          color: orange,
                                          fontSize: textSm,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.6,
                                      padding: spacing(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'Open',
                                        style: TextStyle(
                                          color: primaryGray,
                                          fontSize: textMed,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
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
