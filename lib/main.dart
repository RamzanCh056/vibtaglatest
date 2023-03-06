import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/front.dart';
import 'package:vibetag/provider/post_provider.dart';
import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/provider/user_detailsProvider.dart';
import 'package:vibetag/screens/auth/login.dart';
import 'package:vibetag/screens/funding/funding.dart';
import 'package:vibetag/screens/job/job.dart';
import 'package:vibetag/screens/my_page_screen/my_page.dart';
import 'package:vibetag/screens/playlists/playlists_detail.dart';
import 'package:vibetag/utils/constant.dart';

import 'screens/activties/activities.dart';
import 'screens/album/album.dart';
import 'screens/album/create_album.dart';
import 'screens/album/my_album.dart';
import 'screens/events/create_event.dart';
import 'screens/livestream/create/show_pop.dart';
import 'screens/my_page_screen/browse_event_screen.dart';
import 'screens/playlists/playlist.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  Stripe.publishableKey = "pk_live_CKH3h9YVz6twINIZOhdGkzF400RL7ABult";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
          create: (context) => UsersDetailsProvider(),
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
        home: true
            ? Funding()
            : FutureBuilder(
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
                    if (userId == null) {
                      return const Login();
                    } else {
                      loginUserId = userId;
                      return const FrontPage();
                    }
                  }
                  return const Login();
                },
              ),
      ),
    );
  }
}
