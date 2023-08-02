import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../methods/api.dart';
import '../../../utils/constant.dart';

class SuggestedPage extends StatefulWidget {
  const SuggestedPage({Key? key}) : super(key: key);

  @override
  State<SuggestedPage> createState() => _SuggestedPageState();
}

class _SuggestedPageState extends State<SuggestedPage> {
  List<dynamic> pages = [];
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
    print(pages);
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
                              Container(
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
                                  'Like',
                                  style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
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
    ;
  }
}

class CarPartsCard extends StatelessWidget {
  const CarPartsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255,
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width * 0.48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.grey.shade400,
            ),
            child: Icon(
              Icons.image_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.48,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Raqoni Car Parts",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                Text(
                  "Cars and Vehicles",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.orange,
                      fontSize: 13),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Like"),
                          Text(
                            "1",
                            style: TextStyle(color: Colors.orange),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Post"),
                          Text(
                            "148",
                            style: TextStyle(color: Colors.orange),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange),
                  child: Center(
                      child: Text(
                    "Like",
                    style: TextStyle(color: Colors.white),
                  )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
