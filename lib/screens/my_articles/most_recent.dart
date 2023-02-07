import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';

import '../../utils/constant.dart';
class MostRecentBlogs extends StatefulWidget {
  const MostRecentBlogs({Key? key}) : super(key: key);

  @override
  State<MostRecentBlogs> createState() => _MostRecentBlogsState();
}

class _MostRecentBlogsState extends State<MostRecentBlogs> {
  var article= [];
  getRecentArticle()async{
    var headers = {
      'Cookie': 'PHPSESSID=2b08ff8115de29d941a46da6eb381cb9; _us=1672220912; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-12-27%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'blog-operations',
      'sub_type': 'get-recent-articles',
      'user_id': loginUserId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res =  await response.stream.bytesToString();
      var body = jsonDecode(res);
      article = body['articles'];
      print("articles is == $article");
    }
    else {
    print(response.reasonPhrase);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: FutureBuilder(
              future: getRecentArticle(),
              builder: (context,AsyncSnapshot snapshot) {
                if ( snapshot.connectionState == ConnectionState.waiting) {
                  return  Center(
                    child: CircularProgressIndicator(),
                  );

                } else {
                  return   ListView.builder(
                    itemCount: article.length,
                    itemBuilder: (context,index){
                      return  Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),


                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(article[index]['author']['avatar']),
                                ),
                                title: Text(article[index]['author']['username']),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("@${article[index]['author']['username']}"),

                                  ],
                                ),
                                trailing: FittedBox(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.flag,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.orangeAccent,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Center(child: Text("Press")),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Image.network(article[index]['thumbnail'],
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article[index]['title'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ReadMoreText(
                                    article[index]['description'],
                                    trimLines: 2,
                                    colorClickableText: Colors.pink,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: 'Show less',
                                    lessStyle:TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue) ,
                                    moreStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                                  ),
                                  // RichText(
                                  //   text: TextSpan(
                                  //       text:
                                  //       "FRANK MULLER V 45 SCDT  COBRA ST Cobra Replica Watch..",
                                  //       style: TextStyle(
                                  //           fontWeight: FontWeight.w400,
                                  //           color: Colors.black),
                                  //       children: [
                                  //         TextSpan(
                                  //           text: "Read more",
                                  //           style: TextStyle(color: Colors.blue),
                                  //         )
                                  //       ]),
                                  // ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.emoji_emotions_outlined),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text("Like"),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text("465"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.message),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text("Comments"),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text("321"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.refresh_sharp),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text("Revibed"),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text("212"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              }),




        ),
      ),
    );
  }
}


