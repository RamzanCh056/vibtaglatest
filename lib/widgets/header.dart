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
              InkWell(
                onTap: widget.onTap,
                child: const Icon(
                  Icons.menu_sharp,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Container(
                width: width * 0.6,
                height: height * 0.05,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    width * 0.1,
                  ),
                ),
                child: TextFormField(
                  onTap: () {
                    SearchPopup(context: context);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(77, 27, 26, 26),
                    ),
                    contentPadding: const EdgeInsets.only(
                      left: 0,
                      right: 10,
                    ),
                    hintText: 'Search for Peoples, pages, groups & #hastags',
                    prefix: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                      ),
                    ),
                    suffix: const Icon(
                      Icons.search,
                      size: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.03,
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Options(context: context);
                },
                child: Container(
                  width: width * 0.07,
                  height: width * 0.07,
                  child: Image.asset(
                    'assets/icons/options_new.png',
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
                  width: width * 0.07,
                  height: width * 0.07,
                  child: Image.asset(
                    'assets/icons/message.png',
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
