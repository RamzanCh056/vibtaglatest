import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/chat_screens/video_call/dialing_call.dart';
import 'package:vibetag/screens/chat_screens/video_call/video_call.dart';
import 'package:get/get.dart';
import '../../methods/api.dart';
import '../../utils/constant.dart';
import 'group_call/group_video_call.dart';

double screenHeightSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / 650.0;
}

double screenWidthSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.width / 400.0;
}

//COLORS
Color orangeColor = HexColor('#FF9200');
Color greyColor = HexColor('#C8D1E5');
Color txtColor = HexColor('#7D8CAC');
Color lightGrey = HexColor('#F8F9FB');
Color fontColor = HexColor('#485470');
Color cyanGreenColor = HexColor('#7C9780');
Color highShadeOrangeColor = HexColor('#FFC107');
Color lightGreenColor = HexColor('#85FF72');
String tokenGeneratorUrl = 'https://lime-rich-bison.cyclic.app/access_token';
const appId = '82046c1c04bd4078880e28c6ec5862d7';
const certificate = 'b041abf3363347e190b12bcc5ad6e39d';
incommingCall(Map<String, dynamic> user) async {
  CallKitParams params = CallKitParams(
    id: loginUserId.toString(),
    nameCaller: user['name'],
    avatar: user['avatar'],
    appName: 'VibeTag',
    handle: user['username'],
    type: int.parse(remote_user_data['call_type'].toString()).toDouble(),
    textAccept: 'ACCEPT',
    textDecline: 'DECLINE',
    textMissedCall: "Miss Call",
    textCallback: 'Call Back',
    duration: 30000,
    extra: {
      'user_id': loginUserId,
    },
    android: AndroidParams(
      isCustomNotification: true,
      isShowLogo: true,
      isShowMissedCallNotification: true,
      isShowCallback: true,
      ringtonePath: 'system_ringtone_default',
      backgroundColor: '#C8D1E5',
      actionColor: '#FF9200',
      incomingCallNotificationChannelName: 'Incoming call',
      missedCallNotificationChannelName: 'Missed call',
    ),
  );
  await FlutterCallkitIncoming.showCallkitIncoming(params);
}

callEvents(BuildContext context) {
  FlutterCallkitIncoming.onEvent.listen((CallEvent? event) async {
    switch (event!.event) {
      case Event.ACTION_CALL_INCOMING:
        // TODO: received an incoming call
        break;
      case Event.ACTION_CALL_START:
        // TODO: started an outgoing call
        // TODO: show screen calling in Flutter
        break;
      case Event.ACTION_CALL_ACCEPT:
      
        if (remote_user_data['call_type'].toString() == '1') {
          if (remote_user_data['click_action'] == 'user') {
            await API().postData({
              'type': 'calling',
              'action': 'answer_call',
              'id': '${remote_user_data['call_id']}',
              'user_id': '${remote_user_data['rec_id']}',
              'call_type': 'video',
            });
          }
          if (remote_user_data['click_action'] == 'group') {
            pushRoute(
              context: context,
              screen: GroupVideoCall(
                group_id: remote_user_data['rec_id'].toString(),
                is_remote: true,
              ),
            );
          } else {
            pushRoute(
              context: context,
              screen: VideoCall(
                user_id: '${loginUserId}',
                is_remote: true,
                name: remote_user_data['name']!,
                username: remote_user_data['username']!,
                avatar: remote_user_data['avatar']!,
                id: remote_user_data['user_id']!,
              ),
            );
          }
        }
        if (remote_user_data['call_type'].toString() == '0') {
          if (remote_user_data['click_action'] != 'group') {
            final result = await API().postData({
              'type': 'calling',
              'action': 'answer_call',
              'id': '${remote_user_data['call_id']}',
              'user_id': '${remote_user_data['rec_id']}',
              'call_type': 'audio',
            });
          }
          if (remote_user_data['click_action'] == 'group') {
            pushRoute(
              context: context,
              screen: GroupVideoCall(
                group_id: remote_user_data['rec_id'].toString(),
                is_remote: true,
              ),
            );
          } else {
            pushRoute(
              context: context,
              screen: DailingCall(
                name: remote_user_data['name']!,
                username: remote_user_data['username']!,
                avatar: remote_user_data['avatar']!,
                id: remote_user_data['user_id']!,
                verified: int.parse(remote_user_data['verified']!.toString()),
                is_remote: true,
              ),
            );
          }
        }

        break;
      case Event.ACTION_CALL_DECLINE:
        final result = await API().postData({
          'type': 'calling',
          'action': 'decline_call',
          'id': '${remote_user_data['call_id']}',
        });

        break;
      case Event.ACTION_CALL_ENDED:
        // TODO: ended an incoming/outgoing call
        await API().postData({
          'type': 'calling',
          'action': 'caller_cancel_call',
          'id': '${remote_user_data['call_id']}',
        });
        break;
      case Event.ACTION_CALL_TIMEOUT:
        // TODO: missed an incoming call
        break;
      case Event.ACTION_CALL_CALLBACK:
        // TODO: only Android - click action `Call back` from missed call notification
        break;
      case Event.ACTION_CALL_TOGGLE_HOLD:
        // TODO: only iOS
        break;
      case Event.ACTION_CALL_TOGGLE_MUTE:
        // TODO: only iOS
        break;
      case Event.ACTION_CALL_TOGGLE_DMTF:
        // TODO: only iOS
        break;
      case Event.ACTION_CALL_TOGGLE_GROUP:
        // TODO: only iOS
        break;
      case Event.ACTION_CALL_TOGGLE_AUDIO_SESSION:
        // TODO: only iOS
        break;
      case Event.ACTION_DID_UPDATE_DEVICE_PUSH_TOKEN_VOIP:
        // TODO: only iOS
        break;
    }
  });
}

Map<String, String> remote_user_data = {};

String callTiming(int callDuration) {
  String hours = (callDuration ~/ 3600) < 10
      ? '0${(callDuration ~/ 3600)}'
      : '${(callDuration ~/ 3600)}';
  String minutes = (callDuration ~/ 60) < 10
      ? '0${(callDuration ~/ 60)}'
      : '${(callDuration ~/ 60)}';
  String seconds = (callDuration % 60) < 10
      ? '0${callDuration % 60}'
      : '${(callDuration % 60)}';
  return '${hours}:${minutes}:${seconds}';
}

String activeCallId = '';
String currentActiveCallToken = '';
String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

String channel = '';
// late RtcEngine? rtcEngine;

String voiceCallStatusSetup() {
  return 'Dialing...';
}

// bool isJoinedAlready=false;