import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/groups/group_setting/suggested_group_widget.dart';
import 'package:vibetag/screens/page/setting/suggested_page_widget.dart';
import 'package:vibetag/utils/constant.dart';

class SuggestedPageScreen extends StatefulWidget {
  const SuggestedPageScreen({super.key});

  @override
  State<SuggestedPageScreen> createState() => _SuggestedPageScreenState();
}

class _SuggestedPageScreenState extends State<SuggestedPageScreen> {
  List<Widget> suggestedGroups = [];
  List<dynamic> Categories = [];
  bool isLoading = false;
  String categoriId = '';

  getSuggestedPages() async {
    isLoading = true;
    setState(() {});
    if (Categories.length == 0) {
      await getCategories();
    } else {
      Categories.shuffle();
    }
    final result = await API().postData({
      'type': 'get_suggested_pages',
      'user_id': '${loginUserId}',
      'category_id': '${categoriId}',
      'limit': '15',
    });
    final response = jsonDecode(result.body)['data'];
    for (var page in response) {
      suggestedGroups.add(
        SuggestedPageWidget(
          page: page,
        ),
      );
    }
    isLoading = false;
    setState(() {});
  }

  Future<void> getCategories() async {
    final result = await API().postData({
      'type': 'get_page_categories',
      'user_id': '${loginUserId}',
    });
    final response = jsonDecode(result.body);
    for (var category in response) {
      Categories.add(category);
    }
    Categories.shuffle();
  }

  @override
  void initState() {
    getSuggestedPages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loadingSpinner()
        : Column(
            children: [
              Container(
                width: width,
                height: height * 0.26,
                margin: spacing(
                  horizontal: 5,
                  vertical: 0,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        categoriId = Categories[i]['value'].toString();
                        getSuggestedPages();
                      },
                      child: Container(
                        width: width * 0.45,
                        height: height * 0.26,
                        margin: spacing(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius(
                            10,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * 0.2,
                              width: 450,
                              child: ClipRRect(
                                borderRadius: borderRadius(
                                  10,
                                ),
                                child: Image.network(
                                  Categories[i]['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            gap(h: 10),
                            Container(
                              alignment: Alignment.center,
                              width: double.maxFinite,
                              child: Text(
                                setName(
                                  Categories[i]['label'].toString(),
                                  length: 10,
                                ),
                                style: TextStyle(
                                  color: HexColor('#000000'),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Column(children: suggestedGroups),
            ],
          );
  }
}
