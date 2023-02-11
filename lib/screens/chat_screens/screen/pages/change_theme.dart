import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants.dart';
class ChangeTheme extends StatefulWidget {
  const ChangeTheme({Key? key}) : super(key: key);

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  List<Color> themeColor = [
    HexColor('#FFDBDB'),
    HexColor('#FEFFDB'),
    HexColor('#DBFFE9'),
    HexColor('#DBE3FF'),
    HexColor('#FFF5DB'),
    HexColor('#DBF2FF'),
    HexColor('#DBE3FF'),
    HexColor('#DBFFE9'),

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: txtColor,
        automaticallyImplyLeading: true,
        toolbarHeight: 100,
        title:  const Text(
          "Change Theme",
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        centerTitle: true,

      ),
      body: GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          mainAxisExtent: 182,

        ),
        itemCount: themeColor.length,
        itemBuilder: buildListItem,

      ),
    );
  }
  Widget buildListItem(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: themeColor[index],
      ),
      height: 182,
      width: 100,
    );
  }
}
