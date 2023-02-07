import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';

import '../../utils/constant.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({Key? key}) : super(key: key);

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  var article= [];
  getPopularArticle()async{
    var headers = {
      'Cookie': 'PHPSESSID=2b08ff8115de29d941a46da6eb381cb9; _us=1672226674; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-12-27%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'blog-operations',
      'sub_type': 'get-popular-articles',
      'user_id': loginUserId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
   //   print(await response.stream.bytesToString());
      var res =  await response.stream.bytesToString();
      var body = jsonDecode(res);
      article = body['popular_articles'];

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
          padding:  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: FutureBuilder(
              future: getPopularArticle(),
              builder: (context,AsyncSnapshot snapshot) {
                if ( snapshot.connectionState == ConnectionState.waiting) {
                  return  const Center(
                    child: CircularProgressIndicator(),
                  );

                } else {
                  return ListView.builder(
                    itemCount: article.length,
                    itemBuilder: (context,index){
                      return  Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
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
                                      const Icon(
                                        Icons.flag,
                                        color: Colors.blue,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.orangeAccent,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: const Center(child: Text("Press")),
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
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article[index]['title'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ReadMoreText(
                                    article[index]['description'],
                                    trimLines: 2,
                                    colorClickableText: Colors.pink,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: 'Show less',
                                    lessStyle:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue) ,
                                    moreStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
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
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.emoji_emotions_outlined),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: const [
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
                                          const Icon(Icons.message),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: const [
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
                                          const Icon(Icons.refresh_sharp),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: const [
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


