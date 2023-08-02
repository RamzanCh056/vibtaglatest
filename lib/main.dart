import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/front.dart';
import 'package:vibetag/methods/firebase_helper.dart';
import 'package:vibetag/notification/notification.dart';
import 'package:vibetag/provider/post_provider.dart';
import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/screens/activties/activities.dart';
import 'package:vibetag/screens/blog/blogs.dart';
import 'package:vibetag/screens/chat_screens/constants.dart';
import 'package:vibetag/screens/find_friend/filter_screen.dart';
import 'package:vibetag/screens/groups/group_setting/group_setting_screen.dart';
import 'package:vibetag/screens/my_articles/my_article_main_screen.dart';
import 'package:vibetag/screens/page/my_page_screen/browse_event_screen.dart';
import 'package:vibetag/screens/page/setting/my_page.dart';
import 'package:vibetag/screens/page/setting/my_page_screen.dart';
import 'package:vibetag/screens/profile/profile.dart';
import 'package:vibetag/utils/constant.dart';
import 'screens/auth/login.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

final notificationCo = Get.put(NotificationController());

FirebaseMessaging? _firebaseMessaging;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
String? tokenis;
gettoken() {
  FirebaseMessaging.instance.getToken().then((token) {
    assert(token != null);
    tokenis = token;
  });
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message1: ${message.messageId}");
  String? title = message.notification!.title;
  String? body = message.notification!.body;

  AwesomeNotifications().createNotification(
      content: NotificationContent(
    id: 123,
    channelKey: "vibetag",
    color: Colors.white,
    title: title,
    body: body,
    wakeUpScreen: true,
    fullScreenIntent: true,
    category: NotificationCategory.Message,
    autoDismissible: false,
    backgroundColor: Colors.orange,
  ));

  //await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseHelper.init();

  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: "vibetag",
      channelName: "vibetag",
      channelDescription: "vibetag",
      defaultColor: Colors.redAccent,
      ledColor: Colors.white,
      importance: NotificationImportance.Max,
      channelShowBadge: true,
      locked: true,
      defaultRingtoneType: DefaultRingtoneType.Ringtone,
    )
  ]);
  gettoken();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await GetStorage.init();
  // await FirebaseHelper.init();

  _initializeFlutterDownloader();
  notification();
  HttpOverrides.global = new MyHttpOverrides();
  Stripe.publishableKey = "pk_live_CKH3h9YVz6twINIZOhdGkzF400RL7ABult";
  runApp(const MyApp());
}

_initializeFlutterDownloader() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
}

notification() async {
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  _firebaseMessaging?.getNotificationSettings();
  NotificationSettings? settings = await _firebaseMessaging?.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    callEvents(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PostProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.orange,
            fontFamily: 'Manrope',
            scaffoldBackgroundColor: backgroundColor,
          ),
          home: FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Some Issue has occurred!'),
                );
              }
              if (snapshot.hasData) {
                SharedPreferences preferences = snapshot.data!;
                final userId = preferences.getString('userId');
                // updateToken();
                if (userId == null) {
                  return const Login();
                } else {
                  loginUserId = userId;
                  return false
                      ? Profile(user_id: '${loginUserId}')
                      : FrontPage();
                }
              }
              return const Login();
            },
          ),
        ));
  }
}
