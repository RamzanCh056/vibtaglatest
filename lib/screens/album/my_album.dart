import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/header/header.dart';

import 'package:vibetag/widgets/navbar.dart';

import '../../utils/constant.dart';
import 'album.dart';
import 'package:http/http.dart' as http;
class MyAlbum extends StatefulWidget {
  const MyAlbum({super.key});

  @override
  State<MyAlbum> createState() => _MyAlbumState();
}

class _MyAlbumState extends State<MyAlbum> {
  var album = [];
  bool isLoading = true;
  bool isDelete = false;
  var albumId;
  getAlbumList() {

    getAlbum();
  }
  getAlbum()async{
    var headers = {
      'Cookie': 'DO-LB="MTAuMTA2LjAuNDo0NDM="; PHPSESSID=vjrgt9vu26u6i7keuqt66au4bf; _us=1686134568; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-06-06%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'albums',
      'sub_type': 'get_my_albums',
      'user_id': loginUserId,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
       var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
       album = body ['albums'];
       setState(() {
         isLoading = false;
       });
       setState(() {
         album;
       });

    }
    else {
    print(response.reasonPhrase);
    setState(() {
      isLoading = false;
    });
    }


  }
  deleteAlbum()async{
    setState(() {
      isDelete=true;
    });
    var headers = {
      'Cookie': 'DO-LB="MTAuMTA2LjAuNDo0NDM="; PHPSESSID=20iletdp527n65ucqqc69og19m; _us=1686219293; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-06-07%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'albums',
      'sub_type': 'delete_album',
      'user_id': loginUserId,
      'album_id': albumId,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Fluttertoast.showToast(msg:"Deleted" );

      setState(() {
        isDelete=false;
      });
    }
    else {
    print(response.reasonPhrase);
    setState(() {
      isDelete=false;
    });
    }

  }
  @override
  void initState() {
    getAlbum();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavBar(),
                Header(),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      gap(h: 10),
                      Row(
                        children: [
                          gap(w: 15),
                          Container(
                            padding: spacing(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  HexColor('#FF9200'),
                                  HexColor('#FDBA31')
                                ],
                              ),
                              borderRadius: borderRadius(width),
                            ),
                            child: Text(
                              'My Albums',
                              style: TextStyle(
                                color: white,
                              ),
                            ),
                          ),
                          gap(w: 10),
                          GestureDetector(
                            onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AlbumScreen()));
                            },
                            child: Container(
                              padding: spacing(horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: borderRadius(width),
                                border: Border.all(
                                  width: 1,
                                  color: orange,
                                ),
                              ),
                              child: Text(
                                'Create',
                                style: TextStyle(
                                  color: orange,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      gap(h: 20),
                      isLoading?Center(child: CircularProgressIndicator()):
                      StreamBuilder(
                        stream: getAlbumList(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return const Center(child: Text("Error Occured"));
                          }

                         return ListView.builder(
                           shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: album.length,
                            itemBuilder: (context, i) {
                              return Container(
                                margin: spacing(horizontal: 15, vertical: 5),
                                padding: spacing(horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: borderRadius(10),
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(album[i]['album_name']),
                                            isDelete?Center(child: CircularProgressIndicator()):
                                            PopupMenuButton(
                                                icon:  Icon(
                                                  Icons.more_horiz,
                                                  color: grayMed,
                                                  size: 28,
                                                ),
                                                onSelected: (value) {
                                                  if (value == "Delete") {
                                                    _showAlertDialog();
                                                    print("index = ${i}");
                                                    albumId = album[i]['id'];
                                                    print("albumId = ${albumId}");

                                                  } else if (value == "Edit") {
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //     builder: (_) {
                                                    //       return const ViewMedia();
                                                    //     },
                                                    //   ),
                                                    // );
                                                  }

                                                },
                                                shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(20),
                                                    bottomLeft: Radius.circular(20),
                                                    bottomRight: Radius.circular(20),
                                                  ),
                                                ),
                                                itemBuilder: (_) {
                                                  final List items = [
                                                    "Delete",
                                                    "Edit",
                                                    "Add",
                                                  ];
                                                  return items
                                                      .map((e) => PopupMenuItem(
                                                    value: e.toString(),
                                                    child: Text(
                                                      e.toString(),
                                                      style: const TextStyle(fontWeight: FontWeight.w500),
                                                    ),
                                                  ))
                                                      .toList();
                                                }),

                                            // SvgPicture.asset(
                                            //   'assets/new/svg/buzzin/more_h.svg',
                                            //   color: grayMed,
                                            // )
                                          ],
                                        ),
                                        gap(h: 10),
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: borderRadius(10),
                                              child: Image.network(
                                                album[i]['photo_album'][0]['image'],
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 10,
                                              right: 10,
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      'assets/images/Image-2.png'),
                                                  gap(w: 5),
                                                  // Text(
                                                  //   '3',
                                                  //   style: TextStyle(
                                                  //     color: white,
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    // i % 3 == 0
                                    //     ? Positioned(
                                    //         top: 15,
                                    //         right: 20,
                                    //         child: Container(
                                    //           padding: spacing(
                                    //               horizontal: 15, vertical: 15),
                                    //           decoration: BoxDecoration(
                                    //             color: white,
                                    //             borderRadius: borderRadius(10),
                                    //           ),
                                    //           child: Column(
                                    //             crossAxisAlignment:
                                    //                 CrossAxisAlignment.start,
                                    //             children: [
                                    //               Container(
                                    //                 padding: spacing(
                                    //                   vertical: 3,
                                    //                 ),
                                    //                 child: Text('Share'),
                                    //               ),
                                    //               Container(
                                    //                 padding: spacing(
                                    //                   vertical: 3,
                                    //                 ),
                                    //                 child: Text('Edit'),
                                    //               ),
                                    //               Container(
                                    //                 padding: spacing(
                                    //                   vertical: 3,
                                    //                 ),
                                    //                 child: Text('Delete'),
                                    //               ),
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       )
                                    //  : gap(),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog( // <-- SEE HERE
          title: const Text('Delete Album'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want to Delete Album?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                deleteAlbum();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}
