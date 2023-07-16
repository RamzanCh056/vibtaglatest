import 'package:flutter/material.dart';
import 'package:vibetag/screens/home/create_post/category_option.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:http/http.dart' as http;

class PostCategory extends StatefulWidget {
  const PostCategory({super.key});


  @override
  State<PostCategory> createState() => _PostCategoryState();
}

class _PostCategoryState extends State<PostCategory> {
  getCtagories()async{
    var headers = {
      'Cookie': 'PHPSESSID=490af762c83ecdce8638443fb738b94c; _us=1680682130; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2023-04-04%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; post_privacy=0; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'get_post_categories',
      'user_id': '34099'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }

  }
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.85,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: spacing(
              horizontal: 25,
            ),
            child: Container(
              padding: spacing(
                vertical: 20,
              ),
              child: Text(
                'Edit Category',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            height: 2,
            width: double.maxFinite,
            color: grayMed,
          ),
          gap(h: 15),
          categoryOptions(
            title: 'Lifestyle',
            tags: [
              'Beauty',
              'Crookery',
              'Entertainment',
              'Education',
              'Shoppings',
              'Style',
            ],
          ),
          categoryOptions(
            title: 'Music/Audio',
            tags: [
              'Beauty',
              'Crookery',
              'Entertainment',
              'Education',
              'Shoppings',
              'Style',
            ],
          ),
          categoryOptions(
            title: 'Music/Audio',
            tags: [
              'Beauty',
              'Crookery',
              'Entertainment',
              'Education',
              'Shoppings',
              'Style',
            ],
          ),
          categoryOptions(
            title: 'Music/Audio',
            tags: [
              'Beauty',
              'Crookery',
              'Entertainment',
              'Education',
              'Shoppings',
              'Style',
            ],
          ),
          gap(h: 30),
          Container(
            margin: spacing(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.35,
                  padding: spacing(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: borderRadius(10),
                    color: grayLight,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: grayMed,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                gap(w: 10),
                Container(
                  width: width * 0.35,
                  padding: spacing(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: borderRadius(10),
                    gradient: gradient,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
