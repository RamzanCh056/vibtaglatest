import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:vab_tag/res/static_info.dart';
import 'components/custom_list_tile.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var getData = [];
  var list;
  getMyPage() async{
    var headers = {
      'Cookie': 'PHPSESSID=65536d5e7505250dba7076459fcc2608; _us=1669911342; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-11-30%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'get_pages',
      'sub_type': 'my_pages',
      'user_id': StaticInfo.userIdLogin,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
     // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
     var  body = jsonDecode(res);
     getData =  body['data'];
      list =  getData[0];
      print("data == $getData");
      print("list == $list");
    // var Data = ;
    }
    else {
    print(response.reasonPhrase);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: GestureDetector(
      onTap: (){
    getMyPage();
    },
          child: //Container( color: Colors.red,)
          FutureBuilder(
              future:  getMyPage(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data != null || getData != null) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount:getData.length,
                      itemBuilder: (context, index){
                    return  Column(children: [
                     // Text(getData[index]["page_name"],)
                      CustomListTile(
                       circularImage:getData[index]["avatar"] ,
                        title: getData[index]["page_name"],
                        likeImage: 'assets/like.svg',
                        likeTitle: getData[index]["likes"],
                        carImage: 'assets/lable.svg',
                        carTitle:  getData[index]["category"],
                        child: SvgPicture.asset(
                          'assets/editnotes.svg',
                        ),
                      ),
                      // Spacer(),
                      // Container(
                      //   color: Color(0xFFFF9200),
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Text(
                      //               "Market Place\nTerms",
                      //               style: TextStyle(color: Colors.white),
                      //               textAlign: TextAlign.center,
                      //             ),
                      //             SizedBox(
                      //               height: 20,
                      //             ),
                      //             Text(
                      //               "Your\nWishlist",
                      //               style: TextStyle(color: Colors.white),
                      //               textAlign: TextAlign.center,
                      //             ),
                      //           ],
                      //         ),
                      //         Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Text(
                      //               "Refund\nPolicy",
                      //               style: TextStyle(color: Colors.white),
                      //               textAlign: TextAlign.center,
                      //             ),
                      //             SizedBox(
                      //               height: 20,
                      //             ),
                      //             Text(
                      //               "On Sale\nItems",
                      //               style: TextStyle(color: Colors.white),
                      //               textAlign: TextAlign.center,
                      //             ),
                      //           ],
                      //         ),
                      //         Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Text(
                      //               "Start\nSelling",
                      //               style: TextStyle(color: Colors.white),
                      //               textAlign: TextAlign.center,
                      //             ),
                      //             SizedBox(
                      //               height: 20,
                      //             ),
                      //             Text(
                      //               "Find Help &\nSupport",
                      //               style: TextStyle(color: Colors.white),
                      //               textAlign: TextAlign.center,
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 10),
                      //   child: Row(
                      //     children: [
                      //       Text("C 2022 VibeTag"),
                      //       Spacer(),
                      //       Text("C 2022 VibeTag"),
                      //     ],
                      //   ),
                      // ),
                    ],);
                  });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),





        ),
      ),
    );
  }
}
