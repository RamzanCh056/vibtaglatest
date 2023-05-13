import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/android_params.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';

import '../../../../utils/constant.dart';

class CallKitIncomingCall extends StatefulWidget {
  const CallKitIncomingCall({super.key});

  @override
  State<CallKitIncomingCall> createState() => _CallKitIncomingCallState();
}

class _CallKitIncomingCallState extends State<CallKitIncomingCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                CallKitParams params = CallKitParams(
                  id: loginUserId.toString(),
                  nameCaller: 'Umair Shah',
                  handle: '123457',
                  type: 1,
                  extra: {
                    'user_id': loginUserId,
                  },
                );
                await FlutterCallkitIncoming.startCall(params);
              },
              child: Container(
                padding: spacing(
                  horizontal: 25,
                  vertical: 25,
                ),
                child: Text(
                  'Missed Call',
                ),
              ),
            ),
             InkWell(
              onTap: () async {
                CallKitParams params = CallKitParams(
                  id: loginUserId.toString(),
                  nameCaller: 'Umair Shah',
                  avatar: 'https://gomal.thecodepie.com/public/uploads/profile/profile.jpg',
                  appName: 'VibeTag',
                  
                  handle: '12345789',
                  type: 0,
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
                    isShowLogo: false,
                    isShowMissedCallNotification: true,
                    isShowCallback: true,
                    ringtonePath: 'system_ringtone_default',
                    backgroundColor: '#FF0000',
                    // backgroundUrl: 'https://i.pravata.cc/300',
                    actionColor: '#0000FF',
                    incomingCallNotificationChannelName: 'Incoming call',
                    missedCallNotificationChannelName: 'Missed call',
                  ), 
                );
                await FlutterCallkitIncoming.showCallkitIncoming(params);
              },
              child: Container(
                padding: spacing(
                  horizontal: 25,
                  vertical: 25,
                ),
                child: Text(
                  'Incoming Call',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
