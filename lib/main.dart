import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/category_detail.dart';

import 'package:vibetag/screens/auth/login.dart';
import 'package:vibetag/screens/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        backgroundColor: HexColor('#EFEFEF'),
        fontFamily: 'HelveticalNeueLTStd',
      ),
      home: Login(),
    );
  }
}
