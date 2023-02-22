import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

double deviceWidth({required BuildContext context}) {
  return MediaQuery.of(context).size.width;
}

//Colors
Color backgroundColor = HexColor('#D3D3D3');
Color primaryGray = HexColor('#818181');
Color darkGray = HexColor('#B4B4B4');
Color medGray = HexColor('#E6E6E6');
Color lightGray = HexColor('#EFEFEF');
Color whiteGray = HexColor('#F7F7F7');
Color white = HexColor('#FFFFFF');
Color orange = HexColor('#FF9200');
Color accent = HexColor('#000000');
Color blue = HexColor('#2196F3');
Color lightblue = HexColor('#7D8CAC');
Color green = HexColor('#39C46E');
Color red = HexColor('#F05555');
Color lightBg = Color.fromARGB(51, 0, 0, 0);

//New Desgin
Color lightGrayNew = HexColor('#C8D1E5');
Color lightGrayNew2 = HexColor('#F1F4FB');
Color darkGrayNew = HexColor('#434950');
//New Design Color

Color orangeLight = HexColor('#ff9200;');
Color orangePrimary = HexColor('#FF9200');
Color orangeSecondary = HexColor('#FDBA31');
Color blackPrimary = HexColor('#212121');
Color blackLight = HexColor('#7D8CAC');
Color whitePrimary = HexColor('#F8F9FB');
Color whiteSecondary = HexColor('#F1F4FB');
Color grayLight = HexColor('#F1F4FB');
Color grayMed = HexColor('#99A7C7');
Color graySecondary = HexColor('#7D8CAC');
Color grayPrimary = HexColor('#485470');

//Size
double textXXl = 32.0;
double textXl = 28.0;
double textLg = 24.0;
double textMed = 22.0;
double textSm = 18.0;
double textXSm = 14.0;

//Icon Size
double iconMax = 32.0;
double iconMed = 28.0;
double iconMin = 26.0;

//Video Player Control
bool isMuted = true;

String API_Url = 'https://vibetag.com/app_api.php';
final String serverUrl = 'https://vibetagspace.nyc3.digitaloceanspaces.com/';
Gradient gradient = LinearGradient(
  begin: Alignment.centerRight,
  end: Alignment.centerLeft,
  colors: [
    HexColor('#FF9200'),
    HexColor('#FDBA31'),
  ],
);
String loginUserId = '';
List<dynamic> loadedBuzzin = [];
double deviceHeight({required BuildContext context}) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top;
}

EdgeInsets spacing({
  double horizontal = 0,
  double vertical = 0,
}) {
  return EdgeInsets.symmetric(
    horizontal: horizontal,
    vertical: vertical,
  );
}

pushRoute({
  required BuildContext context,
  required Widget screen,
}) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

pushReplacement({
  required BuildContext context,
  required Widget screen,
}) {
  return Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

borderRadius(double radius) {
  return BorderRadius.circular(radius);
}

Widget loadingSpinner() {
  return Center(
    child: Image.asset(
      'assets/images/loading_new.gif',
      width: 50,
    ),
  );
}

Future<XFile?> pickImage() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    return image;
  }
  return null;
}

Future<XFile?> pickImageCamera() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.camera);
  if (image != null) {
    return image;
  }
  return null;
}

ToastMessage({required String message}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: orange,
    textColor: white,
    fontSize: 18.0,
  );
}

String getInK({required int number}) {
  if (number < 1000) {
    return number.toString();
  } else if (number < 1000000) {
    return '${(number / 1000).round()}K';
  } else if (number < 10000000) {
    return '${(number / 1000000).round()}M';
  } else {
    return '${(number / 10000000).round()}B';
  }
}

SizedBox gap({
  double w = 0,
  double h = 0,
}) {
  return SizedBox(
    width: w,
    height: h,
  );
}

final List<String> reactions = [
  'assets/new/gif/thumbs_up.gif',
  'assets/new/gif/sparkling_heart.gif',
  'assets/new/gif/squinting_face.gif',
  'assets/new/gif/hushed_face.gif',
  'assets/new/gif/weary_face.gif',
  'assets/new/gif/pouting_face.gif',
  'assets/new/gif/weary_face.gif',
  'assets/new/gif/broken_heart.gif',
];
final List<String> reactionsText = [
  'Like',
  'Love',
  'Haha',
  'Wow',
  'Sad',
  'Angry',
  'Cry',
  'Heartbroken'
];

String readTimestamp(int timestamp) {
  var now = DateTime.now();
  var format = DateFormat.Hm();
  var date = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
  var diff = date.difference(now);
  var time = '';

  if (diff.inSeconds <= 0 ||
      diff.inSeconds > 0 && diff.inMinutes == 0 ||
      diff.inMinutes > 0 && diff.inHours == 0 ||
      diff.inHours > 0 && diff.inDays == 0) {
    time = format.format(date);
  } else {
    if (diff.inDays == 1) {
      time = diff.inDays.toString() + 'DAY AGO';
    } else {
      time = diff.inDays.toString() + 'DAYS AGO';
    }
  }

  return time;
}

Widget titleForDialog(BuildContext context, String title) {
  return Container(
    color: Theme.of(context).primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    child: Center(
      child: Text(title,
          style:
              const TextStyle(color: Colors.white, fontSize: 17, height: 1.55),
          textAlign: TextAlign.center),
    ),
  );
}

List<String> relationship = [
  'none',
  'Single',
  'In a relationship',
  'Married',
  'Engaged',
];

List<String> aboutIcons = [
  'assets/new/icons/man.png',
  'assets/new/icons/height.png',
  '',
  '',
  '',
  'assets/icons/smoke.png',
  'assets/icons/baby.png',
  'assets/icons/paws.png',
  'assets/icons/college-graduation.png',
  '',
];

bool isVideo({required String ex}) {
  if (ex == '.mp4' ||
      ex == '.avi' ||
      ex == '.mkv' ||
      ex == '.flv' ||
      ex == '.ts') {
    return true;
  }
  return false;
}

List<BoxShadow> boxShadow = [
  BoxShadow(
    offset: Offset.zero,
    color: Color.fromARGB(80, 0, 0, 0),
    blurRadius: 4,
    spreadRadius: 1,
  ),
];

pop(BuildContext context) {
  return Navigator.of(context).pop();
}
