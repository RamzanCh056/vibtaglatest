import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/front.dart';
import 'package:vibetag/provider/post_provider.dart';

import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/provider/user_detailsProvider.dart';

import 'package:vibetag/screens/auth/login.dart';
import 'package:vibetag/screens/groups/group.dart';
import 'package:vibetag/screens/groups/group_old.dart';
import 'package:vibetag/screens/groups/private_group.dart';

import 'package:vibetag/screens/video_player/video_player.dart';
import 'package:vibetag/screens/page/page.dart';
import 'package:vibetag/screens/profile/profile.dart';
import 'package:vibetag/screens/video_player/video_screen.dart';

import 'package:vibetag/utils/constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
          backgroundColor: HexColor('#EFEFEF'),
          fontFamily: 'HelveticalNeueLTStd',
        ),
        home:
        FutureBuilder(
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
