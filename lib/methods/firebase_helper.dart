import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../firebase_options.dart';
import '../screens/chat_screens/constants.dart';

class FirebaseHelper {
  static late FirebaseApp _firebaseApp;
  static late FirebaseMessaging _firebaseMessaging;

  static final FirebaseHelper _singleton = FirebaseHelper._internal();
  static late Timer _timer;

  factory FirebaseHelper() {
    return _singleton;
  }

  FirebaseHelper._internal();

  // To Initialize Firebase
  static Future<void> init() async {
    _firebaseApp = await await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    ;
    await _initCloudMessaging();
  }

  static FirebaseApp getFireBaseApp() {
    return _firebaseApp;
  }

  // To Initialize Firebase FCM
  static Future<void> _initCloudMessaging() async {
    _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.setForegroundNotificationPresentationOptions(
        sound: true, badge: true);
    await requestNotificationPermissions();
    _setUpNotificationListener();
  }

  static Future<NotificationSettings> getNotificationSettings() async {
    return await FirebaseMessaging.instance.getNotificationSettings();
  }

  // To Request Notification Permissions (For IOS)
  static Future<NotificationSettings> requestNotificationPermissions() async {
// for permission
    return await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
  }

  // To Set On Notification Listener
  static void _setUpNotificationListener() {
    //This method will call when the app is in kill state
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        if (message.data['call_type'].toString() == "0") {
          remote_user_data = {
            'name': message.data['name'].toString(),
            'username': message.data['username'].toString(),
            'avatar': message.data['avatar'].toString(),
            'user_id': message.data['user_id'].toString(),
            'call_type': message.data['call_type'].toString(),
            'verified': message.data['verified'].toString(),
            'channel': message.data['channel'].toString(),
            'call_id': message.data['call_id'].toString(),
            'call_action': message.data['call_action'].toString(),
          };
          channel = message.data['channel'].toString();
          print('++++++++++++++++++++++1+++++++++++++++++++++++');
          print(channel);
        }
        if (message.data['call_type'].toString() == "1") {
          remote_user_data = {
            'name': message.data['name'].toString(),
            'username': message.data['username'].toString(),
            'avatar': message.data['avatar'].toString(),
            'user_id': message.data['user_id'].toString(),
            'call_type': message.data['call_type'].toString(),
            'channel': message.data['channel'].toString(),
            'call_id': message.data['call_id'].toString(),
            'call_action': message.data['call_action'].toString(),
          };
          channel = message.data['channel'].toString();
          print('++++++++++++++++++++1+++++++++++++++++++++++++');
          print(channel);
        }

        incommingCall(message.data);
      }
    });

    //This method will call when the app is in foreground state
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
      if (message != null && message.data.isNotEmpty) {
        if (message.data['call_type'].toString() == "0") {
          remote_user_data = {
            'name': message.data['name'].toString(),
            'username': message.data['username'].toString(),
            'avatar': message.data['avatar'].toString(),
            'user_id': message.data['user_id'].toString(),
            'call_type': message.data['call_type'].toString(),
            'channel': message.data['channel'].toString(),
            'verified': message.data['verified'].toString(),
            'call_id': message.data['call_id'].toString(),
            'call_action': message.data['call_action'].toString(),
          };
          channel = message.data['channel'].toString();
          print('+++++++++++++++++++2++++++++++++++++++++++++++');
          print(channel);
        }
        if (message.data['call_type'].toString() == "1") {
          remote_user_data = {
            'name': message.data['name'].toString(),
            'username': message.data['username'].toString(),
            'avatar': message.data['avatar'].toString(),
            'user_id': message.data['user_id'].toString(),
            'call_type': message.data['call_type'].toString(),
            'channel': message.data['channel'].toString(),
            'call_id': message.data['call_id'].toString(),
            'call_action': message.data['call_action'].toString(),
          };
          channel = message.data['channel'].toString();
          print('+++++++++++++++++++++2++++++++++++++++++++++++');
          print(channel);
        }

        incommingCall(message.data);
      }
    });

    //This method will call when the app is in background state
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
      if (message != null) {
        if (message.data['call_type'].toString() == "0") {
          remote_user_data = {
            'name': message.data['name'].toString(),
            'username': message.data['username'].toString(),
            'avatar': message.data['avatar'].toString(),
            'user_id': message.data['user_id'].toString(),
            'call_type': message.data['call_type'].toString(),
            'channel': message.data['channel'].toString(),
            'verified': message.data['verified'].toString(),
            'call_id': message.data['call_id'].toString(),
            'call_action': message.data['call_action'].toString(),
          };
          channel = message.data['channel'].toString();
          print('+++++++++++++++++++3++++++++++++++++++++++++++');
          print(channel);
        }
        if (message.data['call_type'].toString() == "1") {
          remote_user_data = {
            'name': message.data['name'].toString(),
            'username': message.data['username'].toString(),
            'avatar': message.data['avatar'].toString(),
            'user_id': message.data['user_id'].toString(),
            'call_type': message.data['call_type'].toString(),
            'channel': message.data['channel'].toString(),
            'call_id': message.data['call_id'].toString(),
            'call_action': message.data['call_action'].toString(),
          };
          channel = message.data['channel'].toString();
          print('++++++++++++++++++++3+++++++++++++++++++++++++');
          print(channel);
        }
        incommingCall(message.data);
      }
    });
  }

  // To Get Device Token
  static Future<String?> getDeviceToken() async {
    return await _firebaseMessaging.getToken();
  }
}
