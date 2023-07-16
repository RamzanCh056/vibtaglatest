// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class TopAppbar extends StatelessWidget {
//   const TopAppbar({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 36,
//       width: double.infinity,
//       color: Colors.black,
//       child: Row(
//         children: [
//           SizedBox(
//             width: 19,
//           ),
//           SvgPicture.asset(
//             "assets/logo.svg",
//             height: 20,
//             width: 35,
//           ),
//           SizedBox(
//             width: 80,
//           ),
//           Text(
//             "My vibes",
//             style: TextStyle(color: Colors.white),
//           ),
//           SizedBox(
//             width: 15,
//           ),
//           Text(
//             "Set up",
//             style: TextStyle(color: Colors.white),
//           ),
//           SizedBox(
//             width: 15,
//           ),
//           Badge(
//               position: BadgePosition.topEnd(top: -5, end: -6),
//               padding: EdgeInsets.all(2),
//               badgeContent: Text(
//                 "16",
//                 style: TextStyle(fontSize: 12),
//               ),
//               child: Icon(
//                 Icons.notifications,
//                 color: Colors.white,
//               )),
//           SizedBox(
//             width: 20,
//           ),
//           SvgPicture.asset(
//             "assets/commentcard.svg",
//             height: 21,
//             width: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }