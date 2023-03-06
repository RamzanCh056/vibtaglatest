import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vibetag/screens/chat/chat_bar.dart';
import 'package:vibetag/screens/home/options.dart';
import 'package:vibetag/screens/home/search.dart';

import '../screens/chat_screens/screen/bottom_sheet_button_screen.dart';
import '../screens/explore/explore.dart';
import '../screens/home/new_search_filter_us.dart';
import '../screens/home/search_popup.dart';
import '../utils/constant.dart';

class Header extends StatefulWidget {
  Header({
    super.key,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool showOptions = true;
  bool showFilter = false;
  bool recentSearch = false;
  bool searchOptions = false;
  TextEditingController keyword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
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
                width: showOptions ? width * 0.75 : width * 0.95,
                height: height * 0.05,
                margin: spacing(horizontal: width * 0.025),
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
                        width: showOptions ? width * 0.55 : width * 0.9,
                        child: TextFormField(
                          controller: keyword,
                          onTap: () {
                            setState(() {
                              showFilter = true;
                              showOptions = false;
                              recentSearch = true;
                            });
                          },
                          onChanged: (value) {
                            if (!recentSearch) {
                              recentSearch = true;
                              setState(() {});
                            }
                          },
                          onTapOutside: (e) {
                            if (e.position.dy > 118 || e.position.dy < 60) {
                              setState(() {
                                showFilter = false;
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
                              right: showFilter ? 130 : 10,
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
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: showOptions
                          ? gap()
                          : GestureDetector(
                              onTap: () {
                                pushRoute(
                                  context: context,
                                  screen: Explore(),
                                );
                                // setState(() {
                                //   showFilter = true;
                                //   showOptions = false;
                                // });
                                // SearchPopup(
                                //   context: context,
                                //   keyword: keyword.text,
                                // );
                              },
                              child: Container(
                                margin: spacing(
                                  horizontal: 5,
                                  vertical: 5,
                                ),
                                padding: spacing(
                                  horizontal: 15,
                                  vertical: 7,
                                ),
                                decoration: BoxDecoration(
                                  color: orange,
                                  borderRadius: borderRadius(width),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 20,
                                      child: Image.asset(
                                        'assets/new/icons/filter_search.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    gap(w: 10),
                                    Text(
                                      'Filter',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              showOptions
                  ? Container(
                      margin: EdgeInsets.only(
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BottomSheetButtonScreen()));
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
                    )
                  : gap(),
            ],
          ),
        ),
        recentSearch
            ? Container(
                height: height * 0.9,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        recentSearch = !recentSearch;
                        searchOptions = true;
                        setState(() {});
                      },
                      child: NewSearchFilter(),
                    )
                  ],
                ),
              )
            : gap(),
        searchOptions
            ? Container(
                height: height * 0.9,
                child: Column(
                  children: [
                    SearchBarPop(
                      keyword: '',
                    )
                  ],
                ),
              )
            : gap(),
      ],
    );
  }
}
