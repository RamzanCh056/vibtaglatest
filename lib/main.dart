import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/album/album.dart';
import 'package:vibetag/screens/auth/forgot.dart';
import 'package:vibetag/screens/auth/login.dart';
import 'package:vibetag/screens/auth/register.dart';
import 'package:vibetag/screens/blog/blog.dart';
import 'package:vibetag/screens/groups/group.dart';
import 'package:vibetag/screens/help_support/help_support.dart';
import 'package:vibetag/screens/events/create_event.dart';
import 'package:vibetag/screens/events/events.dart';
import 'package:vibetag/screens/auth/login_old.dart';
import 'package:vibetag/screens/buzz/buzz.dart';
import 'package:vibetag/screens/funding/funding.dart';
import 'package:vibetag/screens/home/home.dart';
import 'package:vibetag/screens/job/job.dart';
import 'package:vibetag/screens/nodge/nodge.dart';
import 'package:vibetag/screens/page/page.dart';
import 'package:vibetag/screens/page/pages.dart';
import 'package:vibetag/screens/shop/market/explore.dart';
import 'package:vibetag/screens/shop/market/market.dart';
import 'package:vibetag/screens/memories/memories.dart';
import 'package:vibetag/screens/offers/offers.dart';
import 'package:vibetag/screens/profile/profile.dart';
import 'package:vibetag/screens/saved_post/saved_post.dart';
import 'package:vibetag/screens/setting/setting.dart';
import 'package:vibetag/screens/shop/product/recent_product.dart';
import 'package:vibetag/screens/shop/product/single_product.dart';
import 'package:vibetag/screens/shop/sale/sale.dart';
import 'package:vibetag/screens/ticket/ticket.dart';
import 'package:vibetag/screens/wishlist/wishlist.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        backgroundColor: HexColor('#EFEFEF'),
        fontFamily: 'HelveticalNeueLTStd',
      ),
      home: const Login(),
    );
  }
}
