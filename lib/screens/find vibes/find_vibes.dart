import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/footer.dart';
import '../header/header.dart';
import 'package:vibetag/widgets/navbar.dart';

class FindVibes extends StatefulWidget {
  const FindVibes({super.key});

  @override
  State<FindVibes> createState() => _FindVibesState();
}

class _FindVibesState extends State<FindVibes> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<String> images = [
    'assets/images/findvibe/findvibOne.png',
    'assets/images/findvibe/findvibTwo.png',
    'assets/images/findvibe/findvibThree.png',
    'assets/images/findvibe/findvibTwo.png',
  ];
  List<String> postImages = [
    'assets/images/findvibe/postOne.png',
    'assets/images/findvibe/postTwo.png',
    'assets/images/findvibe/postThree.png',
  ];

  List<String> name = [
    'Entertainment',
    'Architecture',
    'Asian Music',
    'Architecture',
  ];
  List<String> userName = [
    'Gwen Stacy',
    'Gwen CH',
    'Vib Gwen',
  ];

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      key: _key,
      backgroundColor: HexColor('#F1F4FB'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const NavBar(),
                  Header()
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)]),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: width,
                            height: height * 0.25,
                            margin: spacing(
                              horizontal: 5,
                              vertical: 0,
                            ),
                            child: ListView.builder(
                              itemCount: images.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: width * 0.29,
                                  height: height * 0.25,
                                  margin: spacing(horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius(
                                      10,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.2,
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
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
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
                    ListView.builder(
                        itemCount: postImages.length,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: width * 0.12,
                                            height: width * 0.12,
                                            padding: EdgeInsets.all(
                                              width * 0.01,
                                            ),
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/new/images/border.png',
                                                ),
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              radius: width * 0.055,
                                              foregroundImage: const AssetImage("assets/images/findvibe/postUser.png"),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                userName[index],
                                                style: const TextStyle(fontSize: 14, color: Colors.black),
                                              ),
                                              const Text(
                                                '1hr ago',
                                                style: TextStyle(fontSize: 10, color: Color(0xff7D8CAC)),
                                              )
                                            ],
                                          ),
                                          const Expanded(child: Text("")),
                                          const Icon(
                                            Icons.more_horiz,
                                            color: Color(0xff99A7C7),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(postImages[index])),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 45,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons.favorite_border,
                                                    color: Color(0xff99A7C7),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text('2.3k', style: TextStyle(fontSize: 10, color: Color(0xff99A7C7)))
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            height: 45,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons.message,
                                                    color: Color(0xff99A7C7),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text('2.3k', style: TextStyle(fontSize: 10, color: Color(0xff99A7C7)))
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Expanded(child: Text("")),
                                          Container(
                                              height: 45,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius: BorderRadius.circular(100),
                                              ),
                                              child: const Center(
                                                child: Icon(Icons.share, color: Color(0xff99A7C7)),
                                              ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          );
                        }),
                    const SizedBox(
                      height: 25,
                    ),
                    const AppFooter()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
