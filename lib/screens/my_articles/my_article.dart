import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';

import '../../utils/constant.dart';

class MyArticle extends StatefulWidget {
  const MyArticle({Key? key}) : super(key: key);

  @override
  State<MyArticle> createState() => _MyArticleState();
}

class _MyArticleState extends State<MyArticle> {
  var blogs = [];
  getMyArticle()async{
    var headers = {
      'Cookie': 'PHPSESSID=1ced04bada9fee99a1432d05d29f0a97; _us=1671973242; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-12-24%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'blog-operations',
      'sub_type': 'get-my-blogs',
      'user_id': loginUserId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
   //   print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      blogs = body['blogs'];
      print("blog is ==$blogs");

    }
    else {
    print(response.reasonPhrase);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: FutureBuilder(
              future: getMyArticle(),
              builder: (context,AsyncSnapshot snapshot) {
                if ( snapshot.connectionState == ConnectionState.waiting) {
                  return
                    blogs==null || blogs== ""?  Center(child: Text("No blogs Found")):
                    const Center(
                      child: CircularProgressIndicator(),
                    );

                } else {
                  return  ListView.builder(
                    itemCount: blogs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return
                        Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(

                                  image: NetworkImage(

                                    blogs[index]['thumbnail'],


                                    // "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
                                  ),


                                  // colorFilter: ColorFilter.mode(
                                  //   Colors.grey,
                                  //   BlendMode.colorBurn,
                                  // ),

                                  fit: BoxFit.cover)
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                blogs[index]['category_name'],
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                blogs[index]['title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${blogs[index]['view']} views',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    DateFormat('dd MMMM, yyyy')
                                        .format(DateTime
                                        .fromMillisecondsSinceEpoch(
                                        int.parse(
                                          blogs[
                                          index]
                                          [
                                          'posted'],
                                        ) *
                                            1000)

                                    ),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Edit"),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white.withOpacity(0.6),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Delete"),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                    },


                  );
                }
              }),

            )
          ],
        ),
      ),
    );
  }
}


