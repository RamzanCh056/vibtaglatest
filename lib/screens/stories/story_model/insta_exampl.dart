// import 'package:flutter/material.dart';
// //import 'package:share_plus/share_plus.dart';
// import 'package:stories_editor/stories_editor.dart';
//
//
// class Example extends StatefulWidget {
//   const Example({Key? key}) : super(key: key);
//
//   @override
//   State<Example> createState() => _ExampleState();
// }
//
// class _ExampleState extends State<Example> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         resizeToAvoidBottomInset: false,
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => StoriesEditor(
//                         giphyKey: 'C4dMA7Q19nqEGdpfj82T8ssbOeZIylD4',
//                         //fontFamilyList: const ['Shizuru', 'Aladin'],
//                         galleryThumbnailQuality: 300,
//                         //isCustomFontList: true,
//                         onDone: (uri) {
//                           debugPrint(uri);
//                           //Share.shareFiles([uri]);
//                         },
//                       )));
//             },
//             child: const Text('Open Stories Editor'),
//           ),
//         ));
//   }
// }