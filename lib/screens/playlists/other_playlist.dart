import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/constant.dart';
import '../../widgets/footer.dart';

class OtherPlayList extends StatefulWidget {
  const OtherPlayList({Key? key}) : super(key: key);

  @override
  State<OtherPlayList> createState() => _OtherPlayListState();
}

class _OtherPlayListState extends State<OtherPlayList> {
  List<String> images = [
    'assets/images/findvibe/entartainment.png',
    'assets/images/findvibe/findvibThree.png',
    'assets/images/findvibe/findvibTwo.png',
    'assets/images/findvibe/findvibTwo.png',
  ];
  List<String> LatesImages = [
    'assets/images/findvibe/latest.png',
    'assets/images/findvibe/entartainment.png',
    'assets/images/findvibe/findvibThree.png',
    'assets/images/findvibe/findvibTwo.png',
  ];

  List<String> name = [
    'Cartoon Movies',
    'Full Harry Porter Movie',
    'Asian Movie',
    'Architecture',
  ];
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 6)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Popular Playlist",
                      style: TextStyle(
                        color: HexColor('#000000'),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * 0.26,
                    margin: spacing(
                      horizontal: 5,
                      vertical: 0,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: images.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: width * 0.45,
                          height: height * 0.26,
                          margin: spacing(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: borderRadius(
                              10,
                            ),
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: height * 0.2,
                                    width: 450,
                                    child: ClipRRect(
                                      borderRadius: borderRadius(
                                        10,
                                      ),
                                      child: Image.asset(
                                        images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Positioned.fill(
                                      child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            "12 Videos",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )))
                                ],
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  width: double.maxFinite,
                                  child: Text(
                                    name[index],
                                    style: TextStyle(
                                      color: HexColor('#000000'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 6)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Latest Playlist",
                      style: TextStyle(
                        color: HexColor('#000000'),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * 0.26,
                    margin: spacing(
                      horizontal: 5,
                      vertical: 0,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: LatesImages.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: width * 0.45,
                          height: height * 0.26,
                          margin: spacing(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: borderRadius(
                              10,
                            ),
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: height * 0.2,
                                    width: 450,
                                    child: ClipRRect(
                                      borderRadius: borderRadius(
                                        10,
                                      ),
                                      child: Image.asset(
                                        LatesImages[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Positioned.fill(
                                      child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            "12 Videos",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )))
                                ],
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  width: double.maxFinite,
                                  child: Text(
                                    name[index],
                                    style: TextStyle(
                                      color: HexColor('#000000'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 6)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Sponserd",
                      style: TextStyle(
                        color: HexColor('#000000'),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/findvibe/Banner.png',
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            gap(h: 45),
          ],
        ),
      ),
    );
  }
}
