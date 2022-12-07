import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/res/static_info.dart';
import 'package:http/http.dart'as http;
late SharedPreferences preferences;
class LoginController extends GetxController {
  var message;
  var errorText;
  loginfun() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("login func email id == ${preferences.getString('email').toString()}");

    var headers = {
      'Cookie':
      '_us=1662765015; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-09-08%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; PHPSESSID=f9bb8e6ac6beab30ca26a90c68848b5c; _us=1662751389; access=1; ad-con=%7B%26quot%3Bdate%26quot%3B%3A%26quot%3B2022-09-08%26quot%3B%2C%26quot%3Bads%26quot%3B%3A%5B%5D%7D; mode=day; src=1'
    };
    var request = http.MultipartRequest('POST', Uri.parse(StaticInfo.baseUrl));
    request.fields.addAll({
      'type': 'user_login',
      'username': preferences.getString('email').toString(),
      'password': preferences.getString('password').toString(),
      's': DateTime.now().toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var newError;
      if (body['errors'] != null) {
        errorText = body['errors'];
        newError = errorText['error_text'];
      } else {
        var newMessage;
        message = body['messages'];
        newMessage = message['respond_message_1'];
        StaticInfo.userIdLogin = body['user_id'];
        preferences.setString('LoginId', StaticInfo.userSequreLogin.toString());
        print("i am user id After Signup ${StaticInfo.userIdLogin}");
        print("i am new message $newMessage");


      }
    }
    else {
      print(response.reasonPhrase);
    }
  }


}