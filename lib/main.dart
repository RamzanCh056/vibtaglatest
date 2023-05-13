import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:vibetag/front.dart';
import 'package:vibetag/provider/post_provider.dart';
import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/screens/chat_screens/constants.dart';
import 'package:vibetag/utils/constant.dart';
import 'methods/firebase_helper.dart';
import 'screens/auth/login.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseHelper.init();
  HttpOverrides.global = new MyHttpOverrides();
  Stripe.publishableKey = "pk_live_CKH3h9YVz6twINIZOhdGkzF400RL7ABult";
  runApp(const MyApp());
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
          fontFamily: 'HelveticalNeueLTStd',
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
                return FrontPage();
              }
            }
            return const Login();
          },
        ),
      ),
    );
  }
}
