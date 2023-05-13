// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/provider/userProvider.dart';

import '../../../utils/constant.dart';
import '../constants.dart';

class VideoCall extends StatefulWidget {
  final String user_id;
  bool is_remote;
  final String name;
  final String avatar;
  final String username;
  final String id;

  VideoCall({
    Key? key,
    required this.user_id,
    this.is_remote = false,
    required this.name,
    required this.avatar,
    required this.username,
    required this.id,
  }) : super(key: key);

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  int? _remoteUid;
  bool _localUserJoined = false;
  bool muteVoice = false;
  bool muteVideo = false;
  bool isLeaveChannel = false;
  String callStatus = 'Please wait...';
  String token = '';
  bool isFullScreen = false;
  late RtcEngine? rtcEngine;

  @override
  void initState() {
    super.initState();

    if (!widget.is_remote) {
      Timer.periodic(Duration(seconds: 3), (timer) {
        if (_remoteUid == null) {
          checkCallStatus();
        }
      });
      Timer(Duration(seconds: 30), () {
        if (callStatus == 'Not accepted yet.') {
          leaveChannel();
          callStatus = 'No answer';
          setState(() {});
          if (_remoteUid == null) {
            Timer(Duration(seconds: 3), () {
              pop(context);
            });
          }
        }
      });
    }
    getToken();
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
          Timer.periodic(Duration(seconds: 1), (timer) {
            if (!isLeaveChannel) {
              if (mounted == false) {
                rtcEngine!.leaveChannel();
                isLeaveChannel = true;
              }
            }
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          if (!widget.is_remote) {
            _localUserJoined = true;
            setState(() {
              _remoteUid = remoteUid;
            });
          } else {
            _remoteUid = remoteUid;
            setState(() {});
          }
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          leaveChannel();

          setState(() {
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
    await rtcEngine!.muteLocalAudioStream(true);
    await rtcEngine!.leaveChannel();
    isLeaveChannel = true;

    channel = '';
    _localUserJoined = false;
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
      if (callStatus == 'Call declined') {
        Timer(Duration(seconds: 2), () {
          leaveChannel();
          pop(context);
        });
      }
      print(callStatus);
      setState(() {});
    }
  }

  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: rtcEngine!,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: RtcConnection(channelId: channel),
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AvatarGlow(
            glowColor: Color.fromARGB(255, 0, 0, 0),
            endRadius: 120.0,
            duration: const Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: const Duration(milliseconds: 100),
            child: Material(
              // Replace this child with your own
              shape: const CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                radius: 80.0,
                foregroundImage: NetworkImage(widget.avatar),
              ),
            ),
          ),
          Text(
            setName(widget.name),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          gap(h: 5),
          Text(
            widget.username,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: grayPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          gap(h: 10),
          Text(
            callStatus,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: grayPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }
  }

  bool showVolumeBar = false;
  int volumeLevel = 100;

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
    rtcEngine!.leaveChannel();
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
          body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Center(
              child: _remoteVideo(),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                        color: Colors.black.withOpacity(0.5)),
                    width: double.infinity,
                    child: Row(
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
                                isFullScreen = !isFullScreen;
                                setState(() {});
                              },
                              child: Container(
                                width: 25,
                                child: SvgPicture.asset(
                                  isFullScreen
                                      ? 'assets/new/icons/livestream/video_call_arrow_down.svg'
                                      : 'assets/new/icons/livestream/video_call_up_button.svg',
                                  fit: BoxFit.cover,
                                  color: white,
                                ),
                              ),
                            ),
                            gap(h: 10),
                            InkWell(
                              onTap: () async {
                                pop(context);
                                leaveChannel();
                                await rtcEngine!.muteLocalAudioStream(true);
                                muteVideo = !muteVideo;
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
                            showVolumeBar = !showVolumeBar;
                            setState(() {});
                          },
                          child: Container(
                            width: 25,
                            child: SvgPicture.asset(
                              'assets/new/icons/livestream/video_call_volume_button.svg',
                              fit: BoxFit.cover,
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _remoteUid != null || widget.is_remote == true
                ? muteVideo
                    ? gap()
                    : Positioned(
                        right: 15,
                        bottom: 125,
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
                : gap(),
            showVolumeBar
                ? Positioned(
                    bottom: 120,
                    right: 25,
                    child: Container(
                      width: width - 25,
                      height: 120,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
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
      )),
    );
  }
}
