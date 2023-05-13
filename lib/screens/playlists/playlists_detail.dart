// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibetag/screens/playlists/playlist.dart';
import 'package:vibetag/screens/playlists/playlist_item.dart';
import 'package:vibetag/screens/playlists/widgets/video_player_landscape_playlist.dart';
import 'package:video_player/video_player.dart';

import '../../methods/api.dart';
import '../../utils/constant.dart';
import '../../widgets/navbar.dart';
import '../header/header.dart';
import '../page/page.dart';
import '../profile/profile.dart';
import '../video_player/Single_video_player.dart';
import '../video_player/video_player.dart';
import '../video_player/video_player_landscap.dart';
import 'my_playlist.dart';
import 'other_playlist.dart';

class PlayListScreen extends StatefulWidget {
  final Map<String, dynamic> playlist;
  const PlayListScreen({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  late VideoPlayerController videoController;

  int currentTab = 0;
  int currentVideo = 0;
  List<Widget> playlistVideos = [];
  bool isSet = false;
  bool isLikeOrFollow = false;
  List<String> videoBar = [
    'Currently playing',
    'My Playlist',
    'Other Playlist'
  ];
  Map<String, dynamic> playlist = {};
  List<dynamic> videos = [];
  Map<String, dynamic> currentPlaying = {};
  bool isLoading = false;
  bool hideButtton = false;

  @override
  void initState() {
    super.initState();

    getPlaylists();
  }

  getPlaylists() async {
    isLoading = true;

    if (mounted) {
      setState(() {});
    }
    final data = {
      'type': 'playlist_api',
      'action': 'get_playlist_videos',
      'playlist_id': widget.playlist['p_id'].toString(),
      'user_id': loginUserId.toString(),
    };
    final result = await API().postData(data);
    final response = jsonDecode(result.body);
    playlist = response['playlist'];
    videos = response['data'];
    if (videos.length > 0) {
      currentPlaying = videos[0];
      playVideo();

      for (var i = 0; i < videos.length; i++) {
        playlistVideos.add(
          PlaylistItem(
            onTap: () {
              currentVideo = i;
              currentPlaying = videos[i];
              videoController.pause();
              playVideo();
              setState(() {});
            },
            isActive: currentVideo == i ? true : false,
            video: videos[i],
          ),
        );
      }
    }

    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  playVideo() {
    if (videos.length > 0) {
      playlistVideos = [];
      for (var i = 0; i < videos.length; i++) {
        playlistVideos.add(
          PlaylistItem(
            onTap: () {
              currentVideo = i;
              currentPlaying = videos[i];
              videoController.pause();
              playVideo();
              setState(() {});
            },
            isActive: currentVideo == i ? true : false,
            video: videos[i],
          ),
        );
      }
    }
    setState(() {});
    isLikeOrFollow = currentPlaying['page_or_user'].toString() == "user"
        ? currentPlaying['i_followed']
            ? true
            : false
        : currentPlaying['i_liked']
            ? true
            : false;
    videoController = VideoPlayerController.network(currentPlaying['postFile'])
      ..initialize().then(
        (_) {
          if (mounted) {
            videoController.play();
          }

          setMic();

          hideButtton = true;
          if (mounted) {
            setState(() {});
          }
        },
      );
    videoController.addListener(() {
      if (videoController.value.position.inSeconds ==
              videoController.value.duration.inSeconds &&
          !isSet) {
        if ((currentVideo + 1) < (videos.length)) {
          currentPlaying = videos[currentVideo++];
          // videoController.pause();
          // videoController.dispose();
          playVideo();
          isSet = true;
          Timer(Duration(seconds: 15), () {
            isSet = false;
          });
          if (mounted) {
            setState(() {});
          }
        }
      }
    });
  }

  void setMic() {
    isMuted ? videoController.setVolume(0.0) : videoController.setVolume(1.0);
  }

  void videoPlayAndPause() {
    setState(() {
      hideButtton = false;
      videoController.value.isPlaying
          ? videoController.pause()
          : videoController.play();
    });
    Timer(
      Duration(seconds: 3),
      () => {
        if (mounted)
          {
            setState(() {
              hideButtton = true;
            })
          }
      },
    );
  }

  void muteAndUnmute() {
    setState(() {
      isMuted = !isMuted;
      isMuted ? videoController.setVolume(0.0) : videoController.setVolume(1.0);
    });
  }

  followAndUnFollow() async {
    isLikeOrFollow = !isLikeOrFollow;
    setState(() {});
    var data = {};
    if (currentPlaying['page_or_user'] == 'user') {
      data = {
        'type': 'follow_like_join',
        'action': 'follow_user',
        'loggedin_user_id': loginUserId.toString(),
        'user_id': currentPlaying['publisher']['user_id'],
      };
    } else {
      data = {
        'type': 'follow_like_join',
        'action': 'like_page',
        'loggedin_user_id': loginUserId.toString(),
        'user_id': currentPlaying['publisher']['page_id'],
      };
    }

    final result = await API().postData(data);
    print(jsonDecode(result.body));
  }

  @override
  void dispose() {
    super.dispose();
    videoController.dispose();
    videoController.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    width = deviceWidth(context: context);
    height = deviceHeight(context: context);

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    // ]);
    var orientation =
        MediaQuery.of(context).orientation == Orientation.landscape;
    // if (orientation) {
    //   pushRoute(
    //     context: context,
    //     screen: VideoPlayPlaylistLandscap(
    //       playVideos: videos,
    //       controller: videoController,
    //     ),
    //   );
    //   print('++++++++++++++++++++++++++++++++++');
    // }

    return Scaffold(
      backgroundColor: HexColor('#F1F4FB'),
      body: SafeArea(
        child: Container(
          height: height,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: ScrollPhysics(
              parent: NeverScrollableScrollPhysics(),
            ),
            child: isLoading
                ? Container(
                    height: height,
                    child: Center(
                      child: loadingSpinner(),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          NavBar(),
                          Header(),
                          videoController.value.isPlaying ||
                                  videoController.value.isInitialized
                              ? Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        hideButtton = !hideButtton;
                                        setState(() {});
                                        Timer(
                                          Duration(seconds: 3),
                                          () {
                                            if (hideButtton) {
                                              setState(() {
                                                hideButtton = false;
                                              });
                                            }
                                          },
                                        );
                                      },
                                      child: AspectRatio(
                                        aspectRatio:
                                            videoController.value.aspectRatio,
                                        child: VideoPlayer(videoController),
                                      ),
                                    ),
                                    hideButtton
                                        ? gap()
                                        : Positioned(
                                            right: 15,
                                            top: 15,
                                            child: InkWell(
                                              onTap: () {
                                                muteAndUnmute();
                                              },
                                              child: Container(
                                                padding: spacing(
                                                  horizontal: 2,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      50, 0, 0, 0),
                                                  borderRadius: borderRadius(3),
                                                ),
                                                child: isMuted
                                                    ? Icon(
                                                        Icons
                                                            .volume_off_outlined,
                                                        color: white,
                                                        size: 18,
                                                      )
                                                    : Icon(
                                                        Icons
                                                            .volume_up_outlined,
                                                        color: white,
                                                        size: 18,
                                                      ),
                                              ),
                                            ),
                                          ),
                                    Positioned(
                                      bottom: 5,
                                      left: 10,
                                      right: 10,
                                      child: hideButtton
                                          ? Container()
                                          : Column(
                                              children: [
                                                Container(
                                                  child: SizedBox(
                                                    height: 5,
                                                    child:
                                                        VideoProgressIndicator(
                                                      videoController,
                                                      allowScrubbing: true,
                                                      colors:
                                                          VideoProgressColors(
                                                        backgroundColor: white,
                                                        bufferedColor: grayMed,
                                                        playedColor: orange,
                                                      ),
                                                      padding: spacing(),
                                                    ),
                                                  ),
                                                ),
                                                gap(h: 5),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          ValueListenableBuilder(
                                                            valueListenable:
                                                                videoController,
                                                            builder: (context,
                                                                VideoPlayerValue
                                                                    value,
                                                                child) {
                                                              //Do Something with the value.
                                                              return Text(
                                                                '${value.position.inHours}:${value.position.inMinutes}:${value.position.inSeconds % 60}',
                                                                style:
                                                                    TextStyle(
                                                                  color: white,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                          Text(
                                                            ' / ${videoController.value.duration.inHours}:${videoController.value.duration.inMinutes}:${videoController.value.duration.inSeconds % 60}',
                                                            style: TextStyle(
                                                              color: white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          pushRoute(
                                                            context: context,
                                                            screen:
                                                                VideoPlayPlaylistLandscap(
                                                              playVideos:
                                                                  videos,
                                                              controller:
                                                                  videoController,
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          child: Icon(
                                                            Icons.fullscreen,
                                                            color: white,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),
                                    hideButtton
                                        ? gap()
                                        : Positioned(
                                            top: 0,
                                            left: 0,
                                            bottom: 0,
                                            right: 0,
                                            child: Center(
                                              child: hideButtton
                                                  ? Container()
                                                  : InkWell(
                                                      onTap: () {
                                                        videoPlayAndPause();
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        width: 70,
                                                        height: 70,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              borderRadius(50),
                                                          color: Color.fromARGB(
                                                              54, 0, 0, 0),
                                                        ),
                                                        child: Icon(
                                                          videoController.value
                                                                  .isPlaying
                                                              ? Icons.pause
                                                              : Icons
                                                                  .play_arrow,
                                                          size: 48,
                                                          color: white,
                                                        ),
                                                      ),
                                                    ),
                                            ),
                                          )
                                  ],
                                )
                              : Stack(
                                  children: [
                                    Container(
                                      width: double.maxFinite,
                                      height: height * 0.3,
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/new/gif/image_loading1.gif',
                                        image: currentPlaying['postFileThumb'],
                                        fit: BoxFit.cover,
                                        placeholderFit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: orangeLight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          Container(
                            margin: spacing(
                              horizontal: 7,
                              vertical: 7,
                            ),
                            height: height * 0.05,
                            width: double.infinity,
                            child: ListView.builder(
                                itemCount: videoBar.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) {
                                  if (i == currentTab) {
                                    return InkWell(
                                      onTap: () {
                                        if (i == 1) {
                                          pushReplacement(
                                            context: context,
                                            screen: PlayList(
                                              currentPlay: 0,
                                            ),
                                          );
                                        }
                                        if (i == 2) {
                                          pushReplacement(
                                            context: context,
                                            screen: PlayList(
                                              currentPlay: 1,
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        margin: spacing(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        padding: spacing(
                                          horizontal: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color: orangePrimary,
                                          ),
                                          borderRadius: borderRadius(width),
                                        ),
                                        child: Center(
                                          child: Text(
                                            videoBar[i],
                                            style: TextStyle(
                                              color: orange,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return InkWell(
                                    onTap: () {
                                      currentTab = i;
                                      if (i == 1) {
                                        pushReplacement(
                                          context: context,
                                          screen: PlayList(
                                            currentPlay: 0,
                                          ),
                                        );
                                      }
                                      if (i == 2) {
                                        pushReplacement(
                                          context: context,
                                          screen: PlayList(
                                            currentPlay: 1,
                                          ),
                                        );
                                      }
                                    },
                                    child: Container(
                                      margin: spacing(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      padding: spacing(
                                        horizontal: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: borderRadius(width),
                                      ),
                                      child: Center(
                                        child: Text(
                                          videoBar[i],
                                          style: TextStyle(
                                            color: grayMed,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                      Container(
                        height: height * 0.55,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: spacing(horizontal: 15),
                                width: double.maxFinite,
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: width * 0.85,
                                              child: Text(
                                                currentPlaying['postText'],
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: grayPrimary,
                                                ),
                                              ),
                                            ),
                                            gap(h: 10),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        'assets/images/eye.png'),
                                                    gap(w: 5),
                                                    Text(
                                                      '${getInK(number: int.parse(currentPlaying['videoViews'].toString()))} Views',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: grayMed,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                gap(w: width * 0.1),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        'assets/images/heart.png'),
                                                    gap(w: 5),
                                                    Text(
                                                      '${getInK(number: int.parse(currentPlaying['reactions'].toString()))} Reacts',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: grayMed,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Image.asset(
                                          'assets/images/more_v.png',
                                          color: grayMed,
                                        ),
                                      ],
                                    ),
                                    gap(h: 15),
                                    Container(
                                      width: double.maxFinite,
                                      height: 2,
                                      color: grayMed,
                                    ),
                                    gap(h: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                                'assets/images/heart.png'),
                                            gap(w: 5),
                                            Text(
                                              'React',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: grayMed,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                'assets/images/comment.png'),
                                            gap(w: 5),
                                            Text(
                                              'Comments',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: grayMed,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                'assets/images/revibe.png'),
                                            gap(w: 5),
                                            Text(
                                              'Revibed',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: grayMed,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    gap(h: 10),
                                    Container(
                                      width: double.maxFinite,
                                      height: 2,
                                      color: grayMed,
                                    ),
                                    gap(h: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (currentPlaying[
                                                        'page_or_user'] ==
                                                    'user') {
                                                  pushRoute(
                                                      context: context,
                                                      screen: Profile(
                                                        user_id: currentPlaying[
                                                                    'publisher']
                                                                ['user_id']
                                                            .toString(),
                                                      ));
                                                } else {
                                                  pushRoute(
                                                      context: context,
                                                      screen: PageScreen(
                                                        page_id: currentPlaying[
                                                                    'publisher']
                                                                ['page_id']
                                                            .toString(),
                                                      ));
                                                }
                                              },
                                              child: CircleAvatar(
                                                radius: width * 0.08,
                                                foregroundImage: NetworkImage(
                                                  currentPlaying['publisher']
                                                      ['avatar'],
                                                ),
                                              ),
                                            ),
                                            gap(w: 10),
                                            InkWell(
                                              onTap: () {
                                                if (currentPlaying[
                                                        'page_or_user'] ==
                                                    'user') {
                                                  pushRoute(
                                                      context: context,
                                                      screen: Profile(
                                                        user_id: currentPlaying[
                                                                    'publisher']
                                                                ['user_id']
                                                            .toString(),
                                                      ));
                                                } else {
                                                  pushRoute(
                                                      context: context,
                                                      screen: PageScreen(
                                                        page_id: currentPlaying[
                                                                    'publisher']
                                                                ['page_id']
                                                            .toString(),
                                                      ));
                                                }
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    currentPlaying['publisher']
                                                        ['name'],
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: grayPrimary,
                                                    ),
                                                  ),
                                                  gap(h: 7),
                                                  currentPlaying['publisher']
                                                              ['lastseen'] !=
                                                          null
                                                      ? Text(
                                                          readTimestamp(int.parse(
                                                              currentPlaying[
                                                                          'publisher']
                                                                      [
                                                                      'lastseen']
                                                                  .toString())),
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: grayMed,
                                                          ),
                                                        )
                                                      : gap(),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        currentPlaying['publisher']['user_id']
                                                    .toString() !=
                                                loginUserId
                                            ? InkWell(
                                                onTap: () {
                                                  followAndUnFollow();
                                                },
                                                child: Container(
                                                  padding: spacing(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      gradient: gradient,
                                                      borderRadius:
                                                          borderRadius(5)),
                                                  child: Text(
                                                    currentPlaying[
                                                                'page_or_user'] ==
                                                            'user'
                                                        ? isLikeOrFollow
                                                            ? 'Following'
                                                            : 'Follow'
                                                        : isLikeOrFollow
                                                            ? 'Liked'
                                                            : 'Like',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : gap(),
                                      ],
                                    ),
                                    gap(h: 7),
                                    Container(
                                      margin: spacing(
                                        horizontal: 15,
                                        vertical: 7,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        currentPlaying['publisher']['about'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: grayMed,
                                        ),
                                      ),
                                    ),
                                    gap(h: 15),
                                  ],
                                ),
                              ),
                              gap(h: 15),
                              Container(
                                margin: spacing(horizontal: 7),
                                child: Text(
                                  widget.playlist['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              gap(h: 5),
                              SingleChildScrollView(
                                child: Column(
                                  children: playlistVideos,
                                ),
                              ),
                              gap(h: height * 0.15)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
