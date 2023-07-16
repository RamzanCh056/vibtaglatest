// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/header/const.dart';
import 'package:vibetag/screens/header/widget/new_search_filter_us.dart';
import 'package:vibetag/screens/home/widgets/options.dart';

import '../../utils/constant.dart';
import '../chat_screens/constants.dart';
import '../chat_screens/screen/Groups/group_list.dart';
import '../chat_screens/screen/page_show.dart';
import '../chat_screens/screen/pages/single_user_show.dart';
import '../explore/explore.dart';

class Header extends StatefulWidget {
  bool shouldSearch;
  Header({
    Key? key,
    this.shouldSearch = true,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  bool showOptions = true;

  bool searchOptions = false;
  bool isLoading = false;
  TextEditingController keyword = TextEditingController();
  late TabController _tabController;
  FocusNode _focus = FocusNode();
  Map<String, dynamic> response = {};

  searchedText() async {
    setState(() {
      isLoading = true;
    });
    var data = {};
    if (keyword.text.isEmpty) {
      isRecentSearch = true;
      setState(() {});

      data = {
        'type': 'search_history',
        'sub_type': 'get_search_history',
        'user_id': '${loginUserId}',
      };
    } else {
      isRecentSearch = false;
      setState(() {});
      data = {
        'type': 'search_area',
        'sub_type': 'normal',
        'keyword': keyword.text.toString(),
        'user_id': '${loginUserId}',
      };
    }
    final result = await API().postData(data);
    response = jsonDecode(result.body);
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    if (widget.shouldSearch) {
      searchedText();
    }
  }

  @override
  Widget build(BuildContext context) {
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    return Column(
      children: [
        Container(
          width: width,
          height: height * 0.07,
          decoration: const BoxDecoration(
            color: Colors.orange,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: showSearchOption ? width * 0.95 : width * 0.75,
                height: height * 0.05,
                margin: spacing(horizontal: width * 0.025),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: white,
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
                        width: showSearchOption ? width * 0.9 : width * 0.55,
                        child: TextFormField(
                          onTap: () {
                            showSearchOption = true;
                            setState(() {});
                          },
                          controller: keyword,
                          onChanged: (value) {
                            searchedText();
                          },
                          onTapOutside: (e) {
                            if (e.position.dy > 118 || e.position.dy < 60) {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                if (!showOptions) {
                                  showOptions = true;
                                }
                              });
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: grayMed,
                            ),
                            contentPadding: EdgeInsets.only(
                              top: 0,
                              bottom: 8,
                              right: 10,
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
                    ),
                  ],
                ),
              ),
              showSearchOption
                  ? gap()
                  : Container(
                      margin: EdgeInsets.only(
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              messageBottomSheet(context);
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
                          gap(w: 10),
                          InkWell(
                            onTap: () {
                              Options(context: context);
                            },
                            child: Container(
                              child: Image.asset(
                                'assets/new/icons/more_v.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
        showSearchOption
            ? Container(
                height: height * 0.9,
                color: white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          searchOptions = true;
                          setState(() {});
                        },
                        child: isLoading
                            ? loadingSpinner()
                            : NewSearchFilter(
                                search: response,
                              ),
                      ),
                    ],
                  ),
                ),
              )
            : gap()
        // searchOptions ? NewSearchFilter() : gap(),
      ],
    );
  }

  messageBottomSheet(context) {
    showModalBottomSheet(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height / 2),
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(17), topLeft: Radius.circular(17)),
        ),
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setState) => Container(
              height: MediaQuery.of(context).size.height - 150,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.symmetric(
                            horizontal:
                                BorderSide(color: greyColor, width: 0.6))),
                    child: Wrap(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            TabBar(
                                padding: EdgeInsets.zero,
                                indicatorColor: orangeColor,
                                unselectedLabelColor: txtColor,
                                unselectedLabelStyle: TextStyle(
                                    fontSize: screenWidthSize(16, context),
                                    fontWeight: FontWeight.w700),
                                labelColor: orangeColor,
                                labelStyle: TextStyle(
                                    fontSize: screenWidthSize(16, context),
                                    fontWeight: FontWeight.w700),
                                controller: _tabController,
                                tabs: const [
                                  Tab(
                                    text: 'Chats',
                                  ),
                                  Tab(
                                    text: 'Groups',
                                  ),
                                  Tab(
                                    text: 'Pages',
                                  ),
                                ]),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: TabBarView(controller: _tabController, children: [
                      SingleUserShow(),
                      const GroupShow(),
                      const PageChatShow(),
                    ]),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
