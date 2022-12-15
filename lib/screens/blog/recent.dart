import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/constant.dart';
import '../../widgets/footer.dart';

class MostRecent extends StatelessWidget {
  const MostRecent({super.key});

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      width: width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.8,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, i) {
                  return Container(
                    margin: spacing(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: borderRadius(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.1,
                          margin: spacing(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: lightGray,
                            borderRadius: borderRadius(10),
                          ),
                          child: ListTile(
                            leading: const CircleAvatar(
                              foregroundImage: AssetImage(
                                'assets/images/streamer.jpg',
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'David Millan',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                const Text(
                                  '@david_milan1',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Bestqualitywatches',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: orange,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '28 july 2022',
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: darkGray,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            trailing: Container(
                              width: width * 0.3,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/flag.png',
                                    width: width * 0.04,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: width * 0.2,
                                    padding: spacing(
                                      horizontal: 6,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: HexColor('#FAD61C'),
                                      borderRadius: borderRadius(15),
                                    ),
                                    child: Text(
                                      'Entertainment',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.25,
                          width: double.maxFinite,
                          child: Image.asset(
                            'assets/images/cover.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'FRANK MULLAR V 45 SCDT COBRA ST Cobra Replica Watch',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width * 0.8,
                          height: 1,
                          color: darkGray,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: spacing(
                            horizontal: width * 0.01,
                            vertical: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 30,
                                    child: Image.asset(
                                      'assets/icons/like1.png',
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        'Likes',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '465',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 30,
                                    child: Image.asset(
                                      'assets/icons/comment1.png',
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        'Comments',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '321',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 30,
                                    child: Image.asset(
                                      'assets/icons/revibe1.png',
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        'Revibed',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '212',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
