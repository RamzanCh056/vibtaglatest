import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/constant.dart';

class MyProductsWiget extends StatelessWidget {
  const MyProductsWiget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      child: Container(
        width: width,
        padding: spacing(
          horizontal: 3,
          vertical: 0,
        ),
        height: height * 0.3,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.2,
          ),
          itemCount: 10,
          itemBuilder: (context, i) {
            return Container(
              margin: spacing(
                horizontal: width * 0.01,
                vertical: height * 0.01,
              ),
              decoration: BoxDecoration(
                color: HexColor('#FFFFFF'),
                borderRadius: borderRadius(10),
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: borderRadius(10),
                        color: Colors.white,
                      ),
                      width: width * 0.4,
                      height: height * 0.3,
                    ),
                  ),
                  Positioned(
                    top: width * 0.03,
                    right: width * 0.02,
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.07,
                          height: width * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: borderRadius(width * 0.1),
                            color: Colors.orange,
                          ),
                          child: const Icon(
                            Icons.edit_note_sharp,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: width * 0.07,
                          height: width * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: borderRadius(width * 0.1),
                            color: Colors.orange,
                          ),
                          child: const Icon(
                            Icons.copy,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: width * 0.07,
                          height: width * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: borderRadius(width * 0.1),
                            color: Colors.orange,
                          ),
                          child: const Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: height * 0.09,
                      decoration: BoxDecoration(
                        color: HexColor('#EAEAEA'),
                        borderRadius: borderRadius(5),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  Positioned(
                    bottom: height * 0.04,
                    left: 5,
                    child: Container(
                      height: height * 0.05,
                      alignment: Alignment.center,
                      child: Text(
                        'Toomax Storway 1670',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 5,
                    child: Container(
                      height: height * 0.05,
                      width: width * 0.37,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: spacing(
                                  horizontal: width * 0.01,
                                  vertical: height * 0.001,
                                ),
                                decoration: BoxDecoration(
                                  color: HexColor('#000000'),
                                  borderRadius: borderRadius(10),
                                ),
                                child: Text(
                                  'Gardens & Pets',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.002,
                              ),
                              Container(
                                padding: spacing(
                                  horizontal: width * 0.01,
                                  vertical: height * 0.001,
                                ),
                                decoration: BoxDecoration(
                                  color: HexColor('#000000'),
                                  borderRadius: borderRadius(10),
                                ),
                                child: Text(
                                  'Storage',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child: Text(
                                  '\$235',
                                  style: TextStyle(
                                    color: HexColor('#A0A0A0'),
                                    fontSize: 10,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.002,
                              ),
                              Container(
                                child: const Text(
                                  '\$220.00',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
