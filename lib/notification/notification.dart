// ignore_for_file: must_call_super, unused_local_variable, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart' as storage;
import 'package:shared_preferences/shared_preferences.dart';

class NotificationController extends GetxController {
  var platform, deviceToken;

  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();

    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        if (message.data != null) {
          print("----000----Message33---- ${message.data.toString()}");
          print("----000----Message33---- ${message.messageId!.toString()}");
          print("----message---- ${message.notification!.title.toString()}");
        }
        if (message.notification != null) {
          print("----000----Message331---- ${message.notification?.toString().toString()}");
        }
      }
    });
    if (Platform.isIOS) {
      platform = "ios";
    } else {
      platform = "android";
    }
    super.onInit();
    FirebaseMessaging.instance.getToken().then((token) {
      assert(token != null);
      print("my token is ==${token}");
      deviceToken = token;
      print("----000----Message2----${deviceToken}");
      storage.GetStorage().write("fcm_token", deviceToken);
      print("my token is ==${deviceToken}");
      storage.GetStorage().write("platform", platform);
    });
  }
}
