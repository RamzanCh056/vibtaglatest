import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/groups/group_setting/suggested_group_widget.dart';
import 'package:vibetag/utils/constant.dart';

class SuggestedGroupScreen extends StatefulWidget {
  const SuggestedGroupScreen({super.key});

  @override
  State<SuggestedGroupScreen> createState() => _SuggestedGroupScreenState();
}

class _SuggestedGroupScreenState extends State<SuggestedGroupScreen> {
  List<Widget> suggestedGroups = [];
  List<dynamic> Categories = [];
  bool isLoading = false;
  String categoryId = '';

  getSuggestedGroups() async {
    isLoading = true;
    setState(() {});
    if (Categories.length == 0) {
      await getCategories();
    }
    final data = {
      'type': 'get_suggested_groups',
      'category_id': '${categoryId}',
      'limit': '15',
      'user_id': '${loginUserId}',
    };

    final result = await API().postData(data);
    final response = jsonDecode(result.body);
    for (var group in response) {
      suggestedGroups.add(
        SuggestedGroupWidget(
          group: group,
        ),
      );
    }
    isLoading = false;
    setState(() {});
  }

  Future<void> getCategories() async {
    final result = await API().postData({
      'type': 'get_group_categories',
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
    getSuggestedGroups();
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
                        categoryId = Categories[i]['value'].toString();
                        getSuggestedGroups();
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
                                  length: 13,
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
