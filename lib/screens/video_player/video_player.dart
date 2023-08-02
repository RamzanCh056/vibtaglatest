// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:vibetag/screens/video_player/video_player_landscap.dart';
import 'package:vibetag/screens/video_player/video_screen.dart';
import 'package:vibetag/utils/constant.dart';

/// Stateful widget to fetch and then display video content.
class VideoMediaPlayer extends StatefulWidget {
  final String post_id;
  final String videoUrl;
  final String thumbnail;
  bool isAds;
  bool autoPlay;
  bool videoTimer;
  bool playAfterLoad;
  bool disableTap;
  VideoMediaPlayer({
    Key? key,
    required this.post_id,
    required this.videoUrl,
    required this.thumbnail,
    this.isAds = false,
    this.autoPlay = true,
    this.videoTimer = false,
    this.playAfterLoad = false,
    this.disableTap = false,
  }) : super(key: key);

  @override
  _VideoMediaPlayerState createState() => _VideoMediaPlayerState();
}

class _VideoMediaPlayerState extends State<VideoMediaPlayer> {
  late VideoPlayerController _controller;
  bool isFocused = false;
  bool hideButtton = false;
  bool isIcreased = false;
  bool isDecreased = false;
  bool isViewAdd = false;
  bool isTapped = false;
  bool isInitialized = false;
  bool isSwipe = false;
  int lastPosition = 0;
  double y = 0;
  GlobalKey key = GlobalKey(debugLabel: getRandomString(15));

  initPlayer() async {
    setListener();
    _controller = await VideoPlayerController.network(
      widget.videoUrl.toString(),
    )
      ..initialize().then(
        (_) {
          _controller.addListener(videoListener);
          if (mounted && widget.autoPlay) {
            _controller.play();
          }
          if (mounted && widget.playAfterLoad) {
            _controller.play();
          }
          setMic();
          setState(() {
            hideButtton = true;
          });
        },
      );
    isInitialized = true;

    setState(() {});
  }

  setListener() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (mounted) {
        RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
        Offset position = box.localToGlobal(Offset.zero);
        y = position.dy;

        if (y.toInt() > 100 && y.toInt() < 480) {
        
          if (!_controller.value.isPlaying) {
            _controller.play();
            setState(() {});
          }
        } else {
          if (!isTapped) {
            if (_controller.value.isPlaying) {
              y = 0;
              _controller.pause();
              _controller.removeListener(videoListener);
              if (y.toInt() < 0) {
                _controller.dispose();
              }
              setState(() {});
            }
          }
        }
      }
    });
  }

  void setMic() {
    isMuted ? _controller.setVolume(0.0) : _controller.setVolume(1.0);
  }

  void videoPlayAndPause() {
    setState(() {
      hideButtton = false;
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
    Timer(
      Duration(seconds: 3),
      () => {
        setState(() {
          hideButtton = true;
        })
      },
    );
  }

  videoListener() {
    if (_controller.value.position.inSeconds > 10 && !isViewAdd) {
      isViewAdd = true;
      addVideoView();
      
    }
  }

  void muteAndUnmute() {
    setState(() {
      isMuted = !isMuted;
      isMuted ? _controller.setVolume(0.0) : _controller.setVolume(1.0);
    });
  }

  addVideoView() async {
    await PostMethods().addVideoView(widget.post_id.toString());
    _controller.removeListener(videoListener);
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    String videoThumbnail = getFullLink(widget.thumbnail);
    return Stack(
      key: key,
      children: [
        InkWell(
          onTap: () {
            if (mounted) {
              setState(() {
                hideButtton = false;
              });
              Timer(
                Duration(seconds: 3),
                () => {
                  setState(() {
                    hideButtton = true;
                  })
                },
              );
            }
          },
          child: VisibilityDetector(
            key: Key('${widget.videoUrl}'),
            onVisibilityChanged: (info) async {
              var isVisible = info.visibleFraction;
              if (widget.autoPlay && !widget.playAfterLoad) {
                if (mounted) {
                  if (isVisible > 0.75) {
                    isSwipe = false;
                    isTapped = false;
                    if (!isInitialized) {
                      await initPlayer();
                    }
                    if (isInitialized) {
                      if (_controller.value.isInitialized &&
                          !_controller.value.isPlaying) {
                        _controller.play();
                        await _controller.seekTo(Duration(
                          seconds: lastPosition,
                        ));
                        setMic();
                        setState(() {
                          isFocused = true;
                        });
                      }
                    }
                  } else {
                    // isSwipe = true;
                    // if (isInitialized) {
                    //   if (!isTapped) {
                    //     if (_controller.value.isPlaying) {
                    //       lastPosition = _controller.value.position.inSeconds;
                    //       isInitialized = false;
                    //       setState(() {});
                    //       await _controller.pause();
                    //       _controller.removeListener(videoListener);
                    //       await _controller.dispose();
                    //       setState(() {
                    //         isFocused = false;
                    //       });
                    //     }
                    //   }
                    // }
                  }
                }
              }
            },
            child: Center(
              child: isInitialized
                  ? InkWell(
                      onTap: () {
                        if (!(widget.isAds)) {
                          hideButtton = false;
                          setState(() {});
                          Timer(Duration(seconds: 5), () {
                            hideButtton = true;
                            if (mounted) {
                              setState(() {});
                            }
                          });
                          if (_controller.value.isInitialized &&
                              !widget.disableTap) {
                            isTapped = true;
                            pushRoute(
                              context: context,
                              screen: VideoScreen(
                                post_id: widget.post_id,
                                controller: _controller,
                              ),
                            );
                          }
                        } else {
                          print(widget.videoUrl);
                        }
                      },
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : Container(
                              width: width,
                              child: Image.network(
                                videoThumbnail,
                                fit: BoxFit.fill,
                              ),
                            ),
                    )
                  : Container(
                      width: width,
                      child: Image.network(
                        videoThumbnail,
                        fit: BoxFit.fill,
                      ),
                    ),
            ),
          ),
        ),
        isFocused
            ? Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Center(
                  child: Center(
                    child: hideButtton
                        ? Container()
                        : InkWell(
                            onTap: () {
                              if (isInitialized) {
                                videoPlayAndPause();
                                setState(() {
                                  isFocused = !isFocused;
                                });
                              }
                            },
                            child: Center(
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius(50),
                                  color: Color.fromARGB(54, 0, 0, 0),
                                ),
                                child: Icon(
                                  isInitialized
                                      ? _controller.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow
                                      : Icons.play_arrow,
                                  size: 48,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              )
            : gap(),
        isFocused
            ? Positioned(
                bottom: 5,
                left: 10,
                right: 10,
                child: isInitialized
                    ? hideButtton
                        ? Container()
                        : Column(
                            children: [
                              Container(
                                child: SizedBox(
                                  height: 5,
                                  child: VideoProgressIndicator(
                                    _controller,
                                    allowScrubbing: true,
                                    colors: VideoProgressColors(
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ValueListenableBuilder(
                                          valueListenable: _controller,
                                          builder: (context,
                                              VideoPlayerValue value, child) {
                                            if (value.position.inSeconds > 10 &&
                                                !isViewAdd) {
                                              isViewAdd = true;
                                              addVideoView();
                                            }
                                            return Text(
                                              '${value.position.inHours}:${value.position.inMinutes % 60}:${value.position.inSeconds % 60}',
                                              style: TextStyle(
                                                color: white,
                                              ),
                                            );
                                          },
                                        ),
                                        Text(
                                          ' / ${_controller.value.duration.inHours}:${_controller.value.duration.inMinutes % 60}:${_controller.value.duration.inSeconds % 60}',
                                          style: TextStyle(
                                            color: white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                LandScapeVideoPlayer(
                                                    controller: _controller),
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
                          )
                    : gap(),
              )
            : gap(),
        isInitialized
            ? widget.videoTimer && _controller.value.isInitialized
                ? Positioned(
                    left: 15,
                    bottom: 5,
                    child: Text(
                      '${_controller.value.duration.inHours}:${_controller.value.duration.inMinutes}:${(_controller.value.duration.inSeconds % 60).toInt()}',
                      style: TextStyle(
                        color: white,
                      ),
                    ),
                  )
                : gap()
            : gap(),
        Positioned(
          right: 15,
          top: 15,
          child: InkWell(
            onTap: () {
              if (isInitialized) {
                muteAndUnmute();
              }
            },
            child: Container(
              padding: spacing(
                horizontal: 2,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(50, 0, 0, 0),
                borderRadius: borderRadius(3),
              ),
              child: isMuted
                  ? Icon(
                      Icons.volume_off_outlined,
                      color: white,
                      size: 18,
                    )
                  : Icon(
                      Icons.volume_up_outlined,
                      color: white,
                      size: 18,
                    ),
            ),
          ),
        ),
        isInitialized
            ? isFocused
                ? Positioned(
                    top: 0,
                    bottom: 0,
                    child: _controller.value.isPlaying
                        ? Container(
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onDoubleTap: () async {
                                    setState(() {
                                      isDecreased = true;
                                    });
                                    await _controller.seekTo(
                                      Duration(
                                        seconds: _controller
                                                .value.position.inSeconds -
                                            10,
                                      ),
                                    );
                                    Timer(
                                      Duration(seconds: 1),
                                      () => {
                                        setState(() {
                                          isDecreased = false;
                                        })
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: width * 0.4,
                                    height: width * 0.4,
                                    child: isDecreased
                                        ? Center(
                                            child: Icon(
                                              Icons.arrow_back_ios_new_outlined,
                                              color: white,
                                            ),
                                          )
                                        : const SizedBox(),
                                  ),
                                ),
                                InkWell(
                                  onDoubleTap: () async {
                                    setState(() {
                                      isIcreased = true;
                                    });
                                    await _controller.seekTo(
                                      Duration(
                                        seconds: _controller
                                                .value.position.inSeconds +
                                            10,
                                      ),
                                    );
                                    Timer(
                                      Duration(seconds: 1),
                                      () => {
                                        setState(() {
                                          isIcreased = false;
                                        })
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: width * 0.4,
                                    height: width * 0.4,
                                    child: isIcreased
                                        ? Center(
                                            child: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: white,
                                            ),
                                          )
                                        : const SizedBox(),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  )
                : gap()
            : gap(),
      ],
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }
}
