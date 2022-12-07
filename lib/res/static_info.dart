import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
class StaticInfo{

  static String baseUrl = 'https://vibetag.com/app_api.php';
  static String imagesUrl = "https://vibetagspace.nyc3.digitaloceanspaces.com/";
  static var userId;
  static var userIdLogin;
  static var userSequreLogin;
  static var PostId;
  static var commentId;
  static var feedId;
  static var lastPostId;
  static var getUserInfo;

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