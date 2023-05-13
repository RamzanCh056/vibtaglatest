// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'package:vibetag/methods/api.dart';
import 'package:vibetag/provider/userProvider.dart';
import 'package:vibetag/screens/chat_screens/group_call/add_users_bar.dart';
import 'package:vibetag/widgets/bottom_modal_sheet_widget.dart';

import '../../../utils/constant.dart';
import '../constants.dart';

class GroupVideoCall extends StatefulWidget {
  final String group_id;
  bool is_remote;
  GroupVideoCall({
    Key? key,
    required this.group_id,
    this.is_remote = false,
  }) : super(key: key);

  @override
  State<GroupVideoCall> createState() => _GroupVideoCallState();
}

class _GroupVideoCallState extends State<GroupVideoCall> {
  Map<String, dynamic> user = {};
  int? _remoteUid;
  bool _localUserJoined = false;
  bool muteVoice = false;
  bool muteVideo = false;
  bool showGroupMembers = false;
  bool showTime = false;
  late RtcEngine? rtcEngine;
  bool isLeaveChannel = false;

  bool showAddMember = false;
  String token = '';
  int callDuration = 0;
  @override
  void dispose() {
    rtcEngine!.leaveChannel();
    isLeaveChannel = true;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    getToken();
    if (!widget.is_remote) {
      Timer(Duration(seconds: 30), () {
        if (_remoteUid == null) {
          leaveChannel();
          Timer(Duration(seconds: 3), () {
            // pop(context);
          });
        }
      });
    }
    super.initState();
  }

  Future<void> getToken() async {
    token = await API().getToken(
      role: 'publisher',
      channel: channel,
    );
    initAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    rtcEngine = createAgoraRtcEngine();
    await rtcEngine!.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    rtcEngine!.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          if (widget.is_remote) {
            setState(() {
              _localUserJoined = true;
            });
          }
          // Timer.periodic(Duration(seconds: 1), (timer) {
          //   if (!isLeaveChannel) {
          //     if (mounted == false) {
          //       rtcEngine!.leaveChannel();
          //       isLeaveChannel = true;
          //     }
          //   }
          // });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");

          if (!widget.is_remote) {
            _localUserJoined = true;
            showTime = true;
            Timer.periodic(Duration(seconds: 1), (timer) {
              if (showTime) {
                callDuration++;
              }
            });
            setState(() {
              _remoteUid = remoteUid;
            });
          } else {
            setState(() {
              _remoteUid = remoteUid;
            });
          }
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          setState(() {
            showTime = false;
            _remoteUid = null;
          });
        },
        onTokenPrivilegeWillExpire:
            (RtcConnection connection, String token) async {
          token = token = await API().getToken();
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    await rtcEngine!.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await rtcEngine!.enableVideo();
    await rtcEngine!.enableAudio();
    await rtcEngine!.startPreview();

    await rtcEngine!.joinChannel(
      token: token,
      channelId: channel,
      uid: 0,
      options: const ChannelMediaOptions(
          // publishCameraTrack: true,
          // publishMicrophoneTrack: true,
          ),
    );
  }

  Future<void> leaveChannel() async {
    await rtcEngine!.leaveChannel();
    isLeaveChannel = true;
    channel = '';
    _localUserJoined = false;
    showTime = false;
    setState(() {});
  }

  void muteCall() async {
    if (rtcEngine! != null) {
      await rtcEngine!.muteLocalAudioStream(muteVoice);
    }
  }

  void muteCamera() async {
    if (rtcEngine! != null) {
      await rtcEngine!.muteLocalVideoStream(muteVideo);
    }
  }

  void switchCamera() async {
    if (rtcEngine! != null) {
      await rtcEngine!.switchCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context, listen: false).user;
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);
    return WillPopScope(
      onWillPop: () async {
        try {
          await leaveChannel();
          return true;
        } catch (e) {
          print(e);
          return false;
        }
      },
      child: Scaffold(
          body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Center(
              child: _remoteUid != null
                  ? AgoraVideoView(
                      controller: VideoViewController.remote(
                        rtcEngine: rtcEngine!,
                        canvas: VideoCanvas(uid: _remoteUid),
                        connection: RtcConnection(channelId: channel),
                      ),
                    )
                  : showGroupMembers
                      ? SafeArea(
                          child: Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        padding: spacing(
                                          horizontal: 10,
                                          vertical: 20,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Ongoing Call'),
                                            Text('05:42'),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        height: 2,
                                        thickness: 1,
                                        color: grayMed,
                                      ),
                                      gap(h: 5),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      showGroupMembers = !showGroupMembers;
                                      // await API().createPushUpNotification(
                                      //   body: 'Hi Umair is Calling you',
                                      //   title: 'New call',
                                      //   fcm: 'Private_Call_1724025',
                                      // );
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: height * 0.9,
                                      margin: spacing(horizontal: 7),
                                      decoration: BoxDecoration(
                                        color: white,
                                      ),
                                      child: GridView.builder(
                                        itemCount: 22,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 5,
                                          crossAxisSpacing: 5,
                                          childAspectRatio: 1,
                                        ),
                                        itemBuilder: (context, i) {
                                          if (i > 19) {
                                            return Container();
                                          }
                                          return Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: i == 0 ? 2 : 0,
                                                color: orange,
                                              ),
                                              borderRadius: borderRadius(7),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  radius: width * 0.15,
                                                  foregroundImage: NetworkImage(
                                                    remote_user_data['avatar']
                                                        .toString(),
                                                  ),
                                                ),
                                                gap(h: 5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 25,
                                                      child: SvgPicture.asset(
                                                        i == 0
                                                            ? 'assets/new/icons/livestream/video_call_microphone_on.svg'
                                                            : 'assets/new/icons/livestream/video_call_microphone.svg',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    gap(w: 5),
                                                    Text(
                                                      setName(remote_user_data[
                                                              'name']
                                                          .toString()),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            showGroupMembers = !showGroupMembers;
                            setState(() {});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AvatarGlow(
                                glowColor: Color.fromARGB(255, 0, 0, 0),
                                endRadius: 120.0,
                                duration: const Duration(milliseconds: 2000),
                                repeat: true,
                                showTwoGlows: true,
                                repeatPauseDuration:
                                    const Duration(milliseconds: 100),
                                child: Material(
                                  // Replace this child with your own
                                  shape: const CircleBorder(),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.grey[100],
                                      radius: 80.0,
                                      foregroundImage: NetworkImage(
                                          remote_user_data['avatar']
                                              .toString())),
                                ),
                              ),
                              gap(h: 30),
                              Text(
                                setName(remote_user_data['name'].toString()),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              gap(h: 5),
                              showTime
                                  ? _remoteUid != null
                                      ? Text(
                                          callTiming(callDuration),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: grayPrimary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : gap()
                                  : gap(),
                            ],
                          ),
                        ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: showAddMember ? 180 : 110,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                        color: Colors.black.withOpacity(0.5)),
                    width: double.infinity,
                    child: Column(
                      children: [
                        gap(h: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                switchCamera();
                                setState(() {});
                              },
                              child: Container(
                                width: 25,
                                child: SvgPicture.asset(
                                  'assets/new/icons/livestream/video_call_swipe_camera.svg',
                                  fit: BoxFit.cover,
                                  color: white,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                muteVideo = !muteVideo;
                                muteCamera();
                                setState(() {});
                              },
                              child: Container(
                                width: 25,
                                child: SvgPicture.asset(
                                  muteVideo
                                      ? 'assets/new/icons/livestream/video_call_mute_video.svg'
                                      : 'assets/new/icons/livestream/video_call_video_button.svg',
                                  fit: BoxFit.cover,
                                  color: white,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    showAddMember = !showAddMember;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 25,
                                    child: SvgPicture.asset(
                                      showAddMember
                                          ? 'assets/new/icons/livestream/video_call_arrow_down.svg'
                                          : 'assets/new/icons/livestream/video_call_up_button.svg',
                                      fit: BoxFit.cover,
                                      color: white,
                                    ),
                                  ),
                                ),
                                gap(h: 10),
                                InkWell(
                                  onTap: () {
                                    if (_localUserJoined) {
                                      leaveChannel();
                                      _localUserJoined = !_localUserJoined;
                                    } else {
                                      initAgora();
                                    }
                                    muteVideo = !muteVideo;
                                    pop(context);
                                    setState(() {});
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        padding: EdgeInsets.all(25),
                                        decoration: BoxDecoration(
                                          color: HexColor('#FF5555'),
                                          borderRadius: borderRadius(50),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        left: 0,
                                        bottom: 4,
                                        top: 0,
                                        child: Container(
                                          width: 25,
                                          child: Center(
                                            child: SvgPicture.asset(
                                              'assets/new/icons/livestream/video_call_end_button.svg',
                                              fit: BoxFit.cover,
                                              color: white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                gap(h: 10),
                                gap(h: 10),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                muteVoice = !muteVoice;
                                muteCall();
                                setState(() {});
                              },
                              child: Container(
                                width: 20,
                                child: SvgPicture.asset(
                                  muteVoice
                                      ? 'assets/new/icons/livestream/video_call_mute_audio.svg'
                                      : 'assets/new/icons/livestream/video_call_audio_button.svg',
                                  fit: BoxFit.cover,
                                  color: white,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                muteVoice = !muteVoice;
                                muteCall();
                                setState(() {});
                              },
                              child: Container(
                                width: 25,
                                child: SvgPicture.asset(
                                  muteVoice
                                      ? 'assets/new/icons/livestream/video_call_mute_volume_off.svg'
                                      : 'assets/new/icons/livestream/video_call_volume_button.svg',
                                  fit: BoxFit.cover,
                                  color: white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        showAddMember
                            ? Divider(
                                thickness: 1,
                                height: 1,
                                color: whitePrimary,
                              )
                            : gap(),
                        showAddMember ? gap(h: 10) : gap(),
                        showAddMember
                            ? InkWell(
                                onTap: () {
                                  createBottomModalSheet(
                                    context: context,
                                    screen: AddUserToStream(),
                                  );
                                },
                                child: Container(
                                  margin: spacing(horizontal: 10, vertical: 0),
                                  padding:
                                      spacing(horizontal: 10, vertical: 15),
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: borderRadius(7),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 25,
                                            child: SvgPicture.asset(
                                              'assets/new/icons/livestream/video_call_add_members.svg',
                                              fit: BoxFit.cover,
                                              color: grayMed,
                                            ),
                                          ),
                                          gap(w: 15),
                                          Text(
                                            'Add new member',
                                            style: TextStyle(
                                              color: grayPrimary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 25,
                                        child: SvgPicture.asset(
                                          'assets/new/icons/livestream/video_call_arrow_right.svg',
                                          fit: BoxFit.cover,
                                          color: grayMed,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : gap()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            muteVideo
                ? gap()
                : Positioned(
                    right: 15,
                    bottom: showAddMember ? 195 : 125,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ClipRRect(
                        borderRadius: borderRadius(7),
                        child: Container(
                          height: 140,
                          width: 90,
                          child: Center(
                            child: _localUserJoined
                                ? AgoraVideoView(
                                    controller: VideoViewController(
                                      rtcEngine: rtcEngine!,
                                      canvas: VideoCanvas(
                                        uid: 0,
                                      ),
                                    ),
                                  )
                                : loadingSpinner(),
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
