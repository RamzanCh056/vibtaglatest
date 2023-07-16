// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:vibetag/provider/userProvider.dart';

import '../../../methods/api.dart';
import '../../../utils/constant.dart';
import '../constants.dart';

class DailingCall extends StatefulWidget {
  bool is_remote;
  final String name;
  final String avatar;
  final String username;
  final String id;
  final int verified;
  DailingCall({
    Key? key,
    required this.is_remote,
    required this.name,
    required this.avatar,
    required this.username,
    required this.id,
    required this.verified,
  }) : super(key: key);

  @override
  State<DailingCall> createState() => _DailingCallState();
}

class _DailingCallState extends State<DailingCall> {
  int? _remoteUid;
  bool _localUserJoined = false;
  bool muteVoice = false;
  bool muteVideo = false;
  bool showVolumeBar = false;
  int volumeLevel = 100;
  bool isLeaveChannel = false;
  late RtcEngine? rtcEngine;

  bool lockScreen = false;
  String token = '';
  String callStatus = 'Please wait...';

  int durationSeconds = 0;
  bool showTime = false;
  bool isFullScreen = false;
  @override
  void initState() {
    super.initState();

    getToken();
    if (!widget.is_remote) {
      Timer.periodic(Duration(seconds: 3), (timer) {
        if (_remoteUid == null) {
          checkCallStatus();
        }
      });
      Timer(Duration(seconds: 30), () {
        if (callStatus == 'Not accepted yet.' && _remoteUid == null) {
          leaveChannel();
          callStatus = 'No answer';
          setState(() {});
          Timer(Duration(seconds: 3), () {
            // pop(context);
          });
        }
      });
    }
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
    await [Permission.microphone].request();
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
            setState(() {
              _remoteUid = remoteUid;
            });
          } else {
            setState(() {
              _remoteUid = remoteUid;
            });
            Timer(Duration(seconds: 25), () {
              if (_remoteUid == null) {
                callStatus = 'Not Connected';
                setState(() {});
                Timer(Duration(seconds: 3), () {
                  pop(context);
                });
              }
            });
          }
          if (_remoteUid != null) {
            showTime = true;
            Timer.periodic(Duration(seconds: 1), (timer) {
              if (mounted) {
                durationSeconds++;
                setState(() {});
              }
            });
          }
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          leaveChannel();
          setState(() {
            showTime = false;
            _remoteUid = null;
          });
          ToastMessage(message: '${remote_user_data['name']} end the call');
          pop(context);
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
    await rtcEngine!.enableAudio();
    // await engine.startPreview();

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
    if (rtcEngine != null) {
      await rtcEngine!.leaveChannel();
      isLeaveChannel = true;
      channel = '';
      _localUserJoined = false;
      setState(() {});
    }
  }

  void muteCall() async {
    if (rtcEngine != null) {
      await rtcEngine!.muteLocalAudioStream(muteVoice);
    }
  }

  void muteCamera() async {
    if (rtcEngine != null) {
      await rtcEngine!.muteLocalVideoStream(muteVideo);
    }
  }

  void switchCamera() async {
    if (rtcEngine != null) {
      await rtcEngine!.switchCamera();
    }
  }

  checkCallStatus() async {
    if (mounted) {
      final result = await API().postData({
        'type': 'calling',
        'action': 'check_call_response',
        'id': '${activeCallId}',
      });
      final response = jsonDecode(result.body);
      callStatus = response['call_status'];

      setState(() {});
    }
  }

  volumeIncrease() async {
    if (volumeLevel < 100) {
      volumeLevel += 10;
      await rtcEngine!.adjustUserPlaybackSignalVolume(
          uid: _remoteUid!, volume: volumeLevel);
    }
    setState(() {});
  }

  volumeDecrease() async {
    if (volumeLevel > 0) {
      volumeLevel -= 10;
      await rtcEngine!.adjustUserPlaybackSignalVolume(
          uid: _remoteUid!, volume: volumeLevel);
    }
    setState(() {});
  }

  @override
  void dispose() {
    leaveChannel();
    isLeaveChannel = true;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        body: Stack(
          children: [
            InkWell(
              onTap: () {
                if (showVolumeBar) {
                  showVolumeBar = !showVolumeBar;
                  setState(() {});
                }
              },
              child: Container(
                color: lockScreen
                    ? Color.fromARGB(69, 0, 255, 179)
                    : Color.fromARGB(0, 33, 149, 243),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      _remoteUid != null ? "On - Call" : "Dialing...",
                      style: TextStyle(color: Color(0xff7D8CAC), fontSize: 24),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AvatarGlow(
                          glowColor: const Color(0xff00FF19),
                          endRadius: 90.0,
                          duration: const Duration(milliseconds: 2000),
                          repeat: true,
                          showTwoGlows: true,
                          repeatPauseDuration:
                              const Duration(milliseconds: 100),
                          child: Material(
                            // Replace this child with your own
                            elevation: 8.0,
                            shape: const CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[100],
                              radius: 60.0,
                              foregroundImage: NetworkImage(widget.avatar),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        widget.verified.toString() == '1'
                            ? CircleAvatar(
                                radius: 7,
                                backgroundColor: Color(0xff54D1B1),
                                child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ))
                            : gap(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.username,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    gap(h: 15),

                    showTime
                        ? Center(
                            child: Text(
                              callTiming(durationSeconds),
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : gap(),
                    gap(h: 10),
                    durationSeconds != 0
                        ? gap()
                        : Text(
                            callStatus,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: grayPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    const Expanded(
                        child: SizedBox(
                      height: 10,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                if (!lockScreen) {
                                  muteVoice = !muteVoice;
                                  await rtcEngine!
                                      .muteLocalAudioStream(muteVoice);
                                  setState(() {});
                                }
                              },
                              child: Icon(
                                muteVoice
                                    ? Icons.mic_off
                                    : Icons.keyboard_voice_outlined,
                                color: Colors.black.withOpacity(0.5),
                                size: 30,
                              ),
                            ),
                            gap(h: 10),
                            Text(
                              muteVoice ? "UnMute" : "Mute",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff485470)),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                if (!lockScreen) {
                                  showVolumeBar = !showVolumeBar;
                                  setState(() {});
                                }
                              },
                              child: Icon(
                                Icons.wifi_calling_3_outlined,
                                color: Colors.black.withOpacity(0.5),
                                size: 30,
                              ),
                            ),
                            gap(h: 10),
                            Text(
                              "Speaker",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff485470)),
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.call_end_outlined,
                              color: Colors.black.withOpacity(0.5),
                              size: 33,
                            ),
                            gap(h: 10),
                            Text(
                              "Hold",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff485470)),
                            )
                          ],
                        ),

                        //   const SizedBox(width: 65,),
                      ],
                    ),
                    gap(h: 15),
                    //  backgroundColor: Color(0xffFF0000).withOpacity(0.2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.black.withOpacity(0.5),
                          size: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!lockScreen) {
                              if (_localUserJoined) {
                                leaveChannel();
                                _localUserJoined = !_localUserJoined;
                              } else {
                                initAgora();
                              }
                              muteVideo = !muteVideo;

                              setState(() {});
                              pop(context);
                            }
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0xffFF0000).withOpacity(0.06),
                            ),
                            child: const Center(
                              child: Icon(Icons.call,
                                  color: Color(0xffFF0000), size: 30),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            lockScreen = !lockScreen;
                            setState(() {});
                          },
                          child: Icon(
                            Icons.lock_open_outlined,
                            color: lockScreen
                                ? red
                                : Colors.black.withOpacity(0.5),
                            size: 30,
                          ),
                        ),

                        //   const SizedBox(width: 65,),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
            ),
            showVolumeBar
                ? Positioned(
                    bottom: 220,
                    child: Container(
                      width: width,
                      height: 120,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 105,
                            width: 10,
                            padding: spacing(horizontal: 2, vertical: 2),
                            decoration: BoxDecoration(
                                color: blue, borderRadius: borderRadius(5)),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    width: 5,
                                    decoration: BoxDecoration(
                                        color: orange,
                                        borderRadius: borderRadius(5)),
                                    height: volumeLevel.toDouble(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          gap(w: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  volumeIncrease();
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_up_outlined,
                                ),
                              ),
                              gap(h: 10),
                              InkWell(
                                onTap: () {
                                  volumeDecrease();
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : gap(),
          ],
        ),
      ),
    );
  }
}
