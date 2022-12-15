import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:vibetag/screens/chat/chat_Tile.dart';
import 'package:vibetag/screens/chat/chat_details.dart';

import '../../utils/constant.dart';

SearchPopup({required BuildContext context}) {
  double width = deviceWidth(context: context);
  double height = deviceHeight(context: context);
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: HexColor('#F0F0F0'),
          insetPadding: EdgeInsets.only(
            top: height * 0.06,
          ),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          iconPadding: EdgeInsets.only(
            top: height * 0.01,
            right: height * 0.01,
            left: width * 0.95,
          ),
          content: Container(
            width: width,
            height: height * 0.8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultTabController(
                    length: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: accent,
                          ),
                          child: const TabBar(
                            unselectedLabelColor:
                                Color.fromARGB(255, 110, 107, 107),
                            labelColor: Colors.orange,
                            indicatorColor: Colors.orange,
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            tabs: [
                              Tab(
                                text: 'Posts',
                              ),
                              Tab(
                                text: 'Users',
                              ),
                              Tab(
                                text: 'Pages',
                              ),
                              Tab(
                                text: 'Groups',
                              ),
                              Tab(
                                text: 'Hashtag',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: height * 0.6,
                          width: double.maxFinite,
                          child: TabBarView(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Type to Posts',
                                      style: TextStyle(
                                        color: lightblue,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 56,
                                      width: width * 0.85,
                                      child: Stack(
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                              hintText: 'Advanced Search',
                                              hintStyle: TextStyle(
                                                fontSize: 16,
                                                color: lightblue,
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                left: 20,
                                              ),
                                              border: InputBorder.none,
                                              prefix: Container(
                                                width: 40,
                                                height: 20,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 18,
                                            left: 15,
                                            child: Container(
                                              child: const Icon(
                                                Icons.search,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Type to Posts',
                                      style: TextStyle(
                                        color: lightblue,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 56,
                                      width: width * 0.85,
                                      child: Stack(
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                              hintText: 'Advanced Search',
                                              hintStyle: TextStyle(
                                                fontSize: 16,
                                                color: lightblue,
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                left: 20,
                                              ),
                                              border: InputBorder.none,
                                              prefix: Container(
                                                width: 40,
                                                height: 20,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 18,
                                            left: 15,
                                            child: Container(
                                              child: const Icon(
                                                Icons.search,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Type to Posts',
                                      style: TextStyle(
                                        color: lightblue,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 56,
                                      width: width * 0.85,
                                      child: Stack(
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                              hintText: 'Advanced Search',
                                              hintStyle: TextStyle(
                                                fontSize: 16,
                                                color: lightblue,
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                left: 20,
                                              ),
                                              border: InputBorder.none,
                                              prefix: Container(
                                                width: 40,
                                                height: 20,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 18,
                                            left: 15,
                                            child: Container(
                                              child: const Icon(
                                                Icons.search,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Type to Posts',
                                      style: TextStyle(
                                        color: lightblue,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 56,
                                      width: width * 0.85,
                                      child: Stack(
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                              hintText: 'Advanced Search',
                                              hintStyle: TextStyle(
                                                fontSize: 16,
                                                color: lightblue,
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                left: 20,
                                              ),
                                              border: InputBorder.none,
                                              prefix: Container(
                                                width: 40,
                                                height: 20,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 18,
                                            left: 15,
                                            child: Container(
                                              child: const Icon(
                                                Icons.search,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Type to Posts',
                                      style: TextStyle(
                                        color: lightblue,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 56,
                                      width: width * 0.85,
                                      child: Stack(
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                              hintText: 'Advanced Search',
                                              hintStyle: TextStyle(
                                                fontSize: 16,
                                                color: lightblue,
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                left: 20,
                                              ),
                                              border: InputBorder.none,
                                              prefix: Container(
                                                width: 40,
                                                height: 20,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 18,
                                            left: 15,
                                            child: Container(
                                              child: const Icon(
                                                Icons.search,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
