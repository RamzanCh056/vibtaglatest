import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/widgets/footer.dart';
import 'package:vibetag/widgets/header.dart';
import 'package:vibetag/widgets/input_field.dart';
import 'package:vibetag/widgets/navbar.dart';
import 'package:vibetag/screens/drawer/drawer.dart';
import 'package:vibetag/widgets/secondary_footer.dart';

import '../../utils/constant.dart';

class CreateNewArticle extends StatefulWidget {
  const CreateNewArticle({super.key});

  @override
  State<CreateNewArticle> createState() => _CreateNewArticleState();
}

class _CreateNewArticleState extends State<CreateNewArticle> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController title = TextEditingController();
  final TextEditingController tag = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      key: _key,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NavBar(),
                Header(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                ),
                Container(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 5,
                          shadowColor: Color.fromARGB(71, 0, 0, 0),
                          child: Container(
                            height: height * 0.07,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                Center(
                                  child: Container(
                                    padding: spacing(
                                      horizontal: 12,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: orange,
                                      borderRadius: borderRadius(
                                        width * 0.1,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.file_copy,
                                      color: white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Create new article',
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width * 0.9,
                          child: InputField(
                            title: 'Title',
                            hintText: 'Title here',
                            controller: title,
                            textColor: '#000000',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width * 0.9,
                          child: InputField(
                            title: 'Description',
                            hintText: 'Write here....',
                            controller: title,
                            textColor: '#000000',
                            maxLine: 8,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width,
                          height: height * 0.9,
                          margin: spacing(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Thumbnail',
                                  style: TextStyle(
                                    fontSize: textMed,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: height * 0.3,
                                  width: double.maxFinite,
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
                                  height: 20,
                                ),
                                const Text(
                                  'Category',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  width: width,
                                  height: height * 0.1,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: width * 0.8,
                                        decoration: BoxDecoration(
                                          color: white,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        ),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'Category here',
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                              left: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: width * 0.1,
                                        child: Table(
                                          children: [
                                            TableRow(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: darkGray,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topRight: Radius.circular(15),
                                                ),
                                              ),
                                              children: const [
                                                TableCell(
                                                  child: Icon(
                                                    Icons
                                                        .keyboard_arrow_up_outlined,
                                                  ),
                                                )
                                              ],
                                            ),
                                            TableRow(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: darkGray,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                              ),
                                              children: const [
                                                TableCell(
                                                  child: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InputField(
                                  title: 'Tags',
                                  hintText: 'Tags here',
                                  controller: tag,
                                  textColor: '#000000',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Post as',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  width: width,
                                  height: height * 0.1,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: width * 0.8,
                                        decoration: BoxDecoration(
                                          color: white,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        ),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'Ali Aslam',
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                              left: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: width * 0.1,
                                        child: Table(
                                          children: [
                                            TableRow(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: darkGray,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topRight: Radius.circular(15),
                                                ),
                                              ),
                                              children: const [
                                                TableCell(
                                                  child: Icon(
                                                    Icons
                                                        .keyboard_arrow_up_outlined,
                                                  ),
                                                )
                                              ],
                                            ),
                                            TableRow(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: darkGray,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(15),
                                                ),
                                              ),
                                              children: const [
                                                TableCell(
                                                  child: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
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
                                              Icons
                                                  .keyboard_arrow_left_outlined,
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
                              ],
                            ),
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
