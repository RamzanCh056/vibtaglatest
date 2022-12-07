import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../res/static_info.dart';
import '../screens/home/home.dart';
class HomeController extends GetxController {
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
  loadMore()async{
    var headers = {
      'Cookie': 'PHPSESSID=ff8d618a6a19e69dba04436edc711de2; _us=1670262416; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-12-04%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'load_more_home_posts',
      'after_post_id': StaticInfo.lastPostId.toString(),
      'user_id': StaticInfo.userIdLogin.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //  print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      loadData = body['posts_data'];
      print("load more data is $loadData");
    }
    else {
      print(response.reasonPhrase);
    }

  }
  getFeed() async {
    var headers = {
      'Cookie':
      'PHPSESSID=ff8d618a6a19e69dba04436edc711de2; _us=1670237077; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-12-04%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'change_feeds',
      'user_id': StaticInfo.userIdLogin.toString(),
      'feed_type': StaticInfo.feedId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
  getUserData() async {
    var headers = {
      'Cookie':
      'PHPSESSID=149a56db22f52ca849a4c8463cf8ddc5; _us=1663512156; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-09-17%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%7B%26quot%3B44%26quot%3B%3A%26quot%3B44%26quot%3B%2C%26quot%3B42%26quot%3B%3A%26quot%3B42%26quot%3B%2C%26quot%3B45%26quot%3B%3A%26quot%3B45%26quot%3B%7D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://vibetag.com/app_api.php'));
    request.fields.addAll({
      'type': 'get_user_data',
      'user_profile_id': StaticInfo.userIdLogin.toString(),
      'user_id': StaticInfo.userIdLogin.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
     StaticInfo.getUserInfo = body['user_data'];
      print("User info is ${StaticInfo.getUserInfo}");

    } else {
      print(response.reasonPhrase);
    }
  }
}