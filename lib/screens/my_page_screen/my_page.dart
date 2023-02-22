import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/my_page_screen/edit_page.dart';
import 'package:vibetag/utils/constant.dart';
import '../../widgets/bottom_modal_sheet_widget.dart';
import 'components/custom_list_tile.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<dynamic> pages = [];
  var getData = [];
  var list;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getMyPage();
  }

  getMyPage() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'type': 'get_pages',
      'sub_type': 'my_pages',
      'user_id':
          loginUserId.toString() != '' ? loginUserId.toString() : '1724025',
    };

    final result = await API().postData(data);
    pages = jsonDecode(result.body)['data'];
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return isLoading
        ? loadingSpinner()
        : Container(
            width: double.infinity,
            child: ListView.builder(
              itemCount: pages.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Container(
                  margin: spacing(horizontal: 15, vertical: 5),
                  width: double.maxFinite,
                  height: height * 0.42,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: borderRadius(15),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Container(
                          height: height * 0.15,
                          child: Image.network(
                            pages[i]['cover'],
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.1,
                        right: 0,
                        left: 0,
                        child: Center(
                          child: Container(
                            width: width * 0.2,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: white,
                              ),
                              borderRadius: borderRadius(width),
                            ),
                            child: CircleAvatar(
                              radius: width * 0.1,
                              foregroundImage: NetworkImage(
                                pages[i]['avatar'],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.21,
                        right: 0,
                        left: 0,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                pages[i]['page_title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              gap(h: 5),
                              Text(
                                pages[i]['category'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: grayMed,
                                ),
                              ),
                              gap(h: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: spacing(
                                        horizontal: width * 0.15, vertical: 15),
                                    margin: spacing(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: grayLight,
                                      borderRadius: borderRadius(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Likes',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: grayMed,
                                          ),
                                        ),
                                        gap(h: 5),
                                        Text(
                                          getInK(
                                              number: int.parse(pages[i]
                                                      ['likes']
                                                  .toString())),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: spacing(
                                        horizontal: width * 0.15, vertical: 15),
                                    margin: spacing(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: grayLight,
                                      borderRadius: borderRadius(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Posts',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: grayMed,
                                          ),
                                        ),
                                        gap(h: 5),
                                        Text(
                                          getInK(
                                              number: int.parse(pages[i]
                                                      ['users_post']
                                                  .toString())),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              gap(h: 10),
                              InkWell(
                                onTap: () {
                                  createBottomModalSheet(
                                    context: context,
                                    screen: EditPage(
                                      page: pages[i],
                                    ),
                                  );
                                },
                                child: Container(
                                  width: width * 0.65,
                                  padding: spacing(
                                      horizontal: width * 0.1, vertical: 15),
                                  margin: spacing(horizontal: 5),
                                  decoration: BoxDecoration(
                                    gradient: gradient,
                                    borderRadius: borderRadius(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Open',
                                    style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}
