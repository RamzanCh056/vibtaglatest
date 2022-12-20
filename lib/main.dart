import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibetag/front.dart';

import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/provider/user_detailsProvider.dart';

import 'package:vibetag/screens/auth/login.dart';

import 'package:vibetag/screens/home/home.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          backgroundColor: HexColor('#EFEFEF'),
          fontFamily: 'HelveticalNeueLTStd',
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
