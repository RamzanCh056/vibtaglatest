import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/android_params.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';

import '../methods/api.dart';
import '../screens/chat_screens/video_call/video_call.dart';

double deviceWidth({required BuildContext context}) {
  return MediaQuery.of(context).size.width;
}

//Colors
Color backgroundColor = HexColor('#F1F4FB');
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

Color orangeLight = HexColor('#ff9200');
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
final String serverUrl = 'https://media.vibetag.com/';
// final String serverUrl = 'https://vibetagspace.nyc3.cdn.digitaloceanspaces.com/';
Gradient gradient = LinearGradient(
  begin: Alignment.centerRight,
  end: Alignment.centerLeft,
  colors: [
    HexColor('#FF9200'),
    HexColor('#FDBA31'),
  ],
);
String loginUserId = '';
List<dynamic> following_data = [];
List<dynamic> likes_data = [];
List<dynamic> groups_data = [];
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
  } else if (number < 1000000000) {
    return '${(number / 1000000).round()}M';
  } else {
    return '${(number / 1000000000).round()}B';
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
    DateTime setDate = DateTime.parse(date.toString());

    time = setDate.hour.toString() + ' hr';
  } else {
    if (diff.inDays == 1) {
      time = diff.inDays.toString() + ' day';
    } else {
      time = diff.inDays.toString() + ' days';
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
bool feeds = false;
List<BoxShadow> lightShadow = [
  BoxShadow(
    offset: Offset.zero,
    color: Color.fromARGB(40, 0, 0, 0),
    blurRadius: 4,
    spreadRadius: 1,
  ),
];
pop(BuildContext context) {
  return Navigator.of(context).pop();
}

bool isNoMorePostsHome = false;
List<String> homePostIds = [];
List<String> homePostAdsIds = [];
List<String> playlistCategories = [];
List<String> playlistColors = [];

double width = 0.0;
double height = 0.0;

EdgeInsets spaceOnly(
    {double left = 0, double right = 0, double top = 0, double bottom = 0}) {
  return EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
}

radiusOnly({
  double topLeft = 0,
  double topRight = 0,
  double bottomLeft = 0,
  double bottomRight = 0,
}) {
  return BorderRadius.only(
    topLeft: Radius.circular(topLeft),
    topRight: Radius.circular(topRight),
    bottomRight: Radius.circular(bottomRight),
    bottomLeft: Radius.circular(bottomLeft),
  );
}

List<String> listOfString(List<dynamic> list) {
  List<String> _list = [];
  for (var string in list) {
    _list.add(string.toString());
  }
  return _list;
}

bool isFollowing(Map<String, dynamic> publisher) {
  List<String> followers_data = publisher['followers_data'] != null
      ? listOfString(publisher['followers_data'])
      : [];
  return followers_data.contains(loginUserId) ? true : false;
}

Map<String, dynamic> followLikeORJoin({required Map<String, dynamic> post}) {
  if (post['page_id'] != '0') {
    if (likes_data.contains(post['page_id'])) {
      return {
        'button_text': 'Liked',
        'id': post['page_id'],
        'type': 'page',
        'isLiked': true,
      };
    } else {
      return {
        'type': 'page',
        'id': post['page_id'],
        'button_text': 'Like',
        'isLiked': false,
      };
    }
  } else if (post['user_id'] != '0') {
    if (following_data.contains(post['user_id'])) {
      return {
        'type': 'user',
        'id': post['user_id'],
        'button_text': 'Following',
        'isLiked': true,
      };
    } else {
      return {
        'type': 'user',
        'id': post['user_id'],
        'button_text': 'Follow',
        'isLiked': false,
      };
    }
  } else if (post['group_id'] != '0') {
    if (groups_data.contains(post['group_id'])) {
      return {
        'type': 'group',
        'id': post['group_id'],
        'button_text': 'Joined',
        'isLiked': true,
      };
    } else {
      return {
        'type': 'group',
        'id': post['group_id'],
        'button_text': 'Join',
        'isLiked': false,
      };
    }
  } else {
    return {
      'type': 'Unknown',
      'id': 0,
      'button_text': 'Unknown',
      'isLiked': false,
    };
  }
}

followUnfollowLikeUnlikeJoinLeave(Map<String, dynamic> data) {
  if (data['type'] == 'user') {
    if (following_data.contains(data['id'])) {
      following_data.remove(
        data['id'],
      );
    } else {
      following_data.add(
        data['id'],
      );
      PostMethods().followOrLike(post: data);
    }
  }
  if (data['type'] == 'page') {
    if (likes_data.contains(data['id'])) {
      likes_data.remove(
        data['id'],
      );
    } else {
      likes_data.add(
        data['id'],
      );
      PostMethods().followOrLike(post: data);
    }
  }
  if (data['type'] == 'group') {
    if (groups_data.contains(data['id'])) {
      groups_data.remove(
        data['id'],
      );
    } else {
      groups_data.add(
        data['id'],
      );
      PostMethods().followOrLike(post: data);
    }
  }
}

isReacted(List<dynamic> reactions) {
  for (var reaction in reactions) {
    if (reaction['user_id'].toString() == loginUserId) {
      return {
        'is_reacted': true,
        'reaction': int.parse(reaction['reaction'].toString())
      };
    }
  }
  return {
    'is_reacted': false,
    'reaction': 0,
  };
}

String getFullLink(String link) {
  return link.contains(serverUrl) ? link : '${serverUrl}${link}';
}

netImage(String url) {
  if (url == '') {
    return Image.asset(
      'assets/placeholder.jpg',
      fit: BoxFit.fill,
    );
  }

  return FadeInImage.assetNetwork(
    placeholder: 'assets/placeholder.jpg',
    image: url.contains(serverUrl) ? url : '${serverUrl}${url}',
    fit: BoxFit.fill,
    imageErrorBuilder: (context, error, stackTrace) {
      return Text('Image');
    },
  );
}

List<dynamic> comments = [];
String comment_id = '';
String replyTo = '';
List<dynamic> stickers = [];

Map<String, dynamic> loginUser = {};

isEmpty(list) {
  if (list.toString() == '') {
    return [];
  } else {
    return list;
  }
}

String setName(String name) {
  if (name.length > 17) {
    return name.substring(0, 13).toString() + '...';
  }
  return name;
}

Future<void> subScribeToNotificationTopic(topic) async {
  await FirebaseMessaging.instance.subscribeToTopic(topic);
}

unSubScribeFromTopic(String topic) async {
  await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
}

String? token = '';
String remote_user_id = '';
updateToken() async {
  token = await FirebaseMessaging.instance.getToken();
  final data = {
    'type': 'update_fcm_token',
    'user_id': loginUserId,
    'token': token,
  };
  await API().postData(data);
}
bool isEnabledCallEvents=false;