import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../drawer/shop_drawer.dart';
import '../shop/shop_header.dart';

class CreateAlbum extends StatefulWidget {
  const CreateAlbum({super.key});

  @override
  State<CreateAlbum> createState() => _CreateAlbumState();
}

class _CreateAlbumState extends State<CreateAlbum> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  TextEditingController albumName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const NavBar(),
                    Header(
                    
                    ),
                  ],
                ),
                Container(
                  width: width,
                  height: height * 0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: height * 0.08,
                          width: width,
                          child: Card(
                            child: Padding(
                              padding: spacing(
                                horizontal: 10,
                                vertical: 0,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: spacing(
                                              horizontal: 7,
                                              vertical: 7,
                                            ),
                                            decoration: BoxDecoration(
                                              color: orange,
                                              borderRadius:
                                                  borderRadius(width * 0.1),
                                            ),
                                            child: Icon(
                                              Icons.waving_hand_rounded,
                                              color: white,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Create Album',
                                            style: TextStyle(
                                              fontSize: textMed,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
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
                          child: InputField(
                            title: 'Album name',
                            hintText: 'Name here',
                            controller: albumName,
                            textColor: '#000000',
                          ),
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
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        const SizedBox(
                          height: 30,
                        ),
                        const SecondaryFooter(),
                        const AppFooter(),
                        const SizedBox(
                          height: 20,
                        ),
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
