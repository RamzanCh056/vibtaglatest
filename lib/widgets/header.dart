import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vibetag/screens/chat/chat_bar.dart';
import 'package:vibetag/screens/home/options.dart';
import 'package:vibetag/screens/home/search.dart';

import '../utils/constant.dart';

class Header extends StatefulWidget {
  final VoidCallback onTap;

  const Header({super.key, required this.onTap});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      width: width,
      height: height * 0.07,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
      ),
      decoration: const BoxDecoration(
        color: Colors.orange,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: width * 0.75,
                height: height * 0.05,
                padding: const EdgeInsets.only(
                  left: 0,
                ),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    width * 0.1,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 40,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: width * 0.55,
                        child: TextFormField(
                          onTap: () {
                            SearchPopup(context: context);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: grayMed,
                            ),
                            hintText: 'Search for anything',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 12,
                      child: Container(
                        width: width * 0.05,
                        height: width * 0.05,
                        child: Image.asset('assets/new/icons/search.png'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.03,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Options(context: context);
                },
                child: Container(
                  width: height * 0.05,
                  height: height * 0.05,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: whitePrimary,
                    borderRadius: borderRadius(width),
                  ),
                  child: Image.asset(
                    'assets/new/icons/chat.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              InkWell(
                onTap: () {
                  ChatBar(
                    context: context,
                  );
                },
                child: Container(
                  child: Image.asset(
                    'assets/new/icons/more_v.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
