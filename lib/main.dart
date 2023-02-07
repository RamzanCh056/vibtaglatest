import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
      )
    );
  }
}


// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   List<String> images = ['perfomance', 'observation', 'action', 'doc', 'team', 'e-docpng'];
//   List<String> title = [
//     "Performance",
//     "Observation",
//     "Action",
//     "Work oder",
//     "Teams",
//     "E-Docs",
//   ];
//   double per = 0.0;
//   List<double> values = [
//     0.7,
//    0.8, 0.9,
//   ];
//   List<String> descrption = [
//     "Standard Operating Procedures for Pesticides Applications, Tools and Pes...",
//     "Standard Operating Procedures for Pesticides Applications, Tools and Pes...",
//     "Standard Operating Procedures for Pesticides Applications, Tools and Pes...",
//     "Standard Operating Procedures for Pesticides Applications, Tools and Pes...",
//     "Standard Operating Procedures for Pesticides Applications, Tools and Pes...",
//     "Standard Operating Procedures for Pesticides Applications, Tools and Pes...",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//
//               complianceCard(),
//               const SizedBox(
//                 height: 20,
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
//   Widget complianceCard() {
//     return InkWell(
//       onTap:(){
//         //values[2] = per;
//
//         setState(() {
//
//          per += 0.1;
//         // print("vl == ${values[0]}");
//
//         });
//
//
//     },
//       child: CircularPercentIndicator(
//         radius: 18.0,
//         lineWidth: 3.0,
//         percent:per,
//         center: Icon(Icons.add),
//         backgroundColor: Colors.transparent,
//         progressColor: Colors.green.withOpacity(0.8),
//       ),
//     );
//   }
// }
