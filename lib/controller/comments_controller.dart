

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../res/static_info.dart';
import '../screens/home/home.dart';


class CommentsController extends GetxController {
  getHomeData() async {
    var headers = {
      'Cookie':
      'PHPSESSID=149a56db22f52ca849a4c8463cf8ddc5; _us=1663499099; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-09-17%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'get_home_posts',
      'user_id': StaticInfo.userIdLogin.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      postData = body['posts_data'];
      print("post data is $postData");
    } else {
      print(response.reasonPhrase);
    }
  }
  deleteComment(var comment) async {
    //print("comment Id controller ${StaticInfo.commentId}");
    var headers = {
      'Cookie': 'PHPSESSID=92c654950a8507f5cba3bb14ee5f40b7; _us=1664901756; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-10-03%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse( StaticInfo.baseUrl));
    request.fields.addAll({
      'type': 'comment_delete',
      'comment_id':  comment,
      'user_id':  StaticInfo.userIdLogin,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var delRes;
      delRes= body['message'];
      print("i am responce of delete $delRes");
      Fluttertoast.showToast(msg: "$delRes");


    }
    else {
      print(response.reasonPhrase);
    }


  }

  
}