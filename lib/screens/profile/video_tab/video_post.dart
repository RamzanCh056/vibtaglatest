// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:path/path.dart' as p;

import 'package:vibetag/screens/home/comment/widget/post_comment_bar.dart';
import 'package:vibetag/screens/home/post_types/widgets/post_bar.dart';
import 'package:vibetag/screens/home/widgets/feelingWidet.dart';
import 'package:vibetag/screens/home/post_methods/post_methods.dart';
import 'package:vibetag/screens/home/post_types/post_file.dart';
import 'package:vibetag/screens/home/widgets/revibe.dart';
import 'package:vibetag/screens/page/page.dart';
import 'package:vibetag/screens/profile/profile.dart';
import 'package:vibetag/widgets/bottom_modal_sheet_widget.dart';
import '../../../utils/constant.dart';
import '../../groups/group.dart';
import '../../hast_tag/tred_screen.dart';
import '../../page/playlists/playlist/playlist_sheet.dart';

class VideoPost extends StatefulWidget {
  final dynamic post;

  VideoPost({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  bool isShowReactions = false;
  bool isAdded = false;
  int reactionValue = 0;
  String responseData = '';
  int totalLikes = 0;
  int userLike = 0;
  bool isLiked = false;
  List<int> reactionOnPost = [];
  List<Widget> reactionsOnPostList = [];

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
    'Break'
  ];
  reactOnPost() async {
    setState(() {
      isAdded = false;
    });
    await PostMethods().reactOnPost(
      post_id: widget.post['post_id'],
      reactionValue: reactionValue.toString(),
    );
    setState(() {
      isAdded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    postReactionsList();

    super.initState();
  }

  postReactionsList() {
    isLiked = followLikeORJoin(post: widget.post)['isLiked'];
    for (var i = 0; i < 8; i++) {
      if (widget.post['reaction']['${i + 1}'] != null) {
        reactionOnPost.add(i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    totalLikes =
        int.parse(widget.post['reaction']['count'].toString()) + userLike;
    String fileExtension = p.extension(widget.post['postFile']);
    bool isAudio = fileExtension == '.mp3' || fileExtension == '.wave';
    bool is_video = isVideo(ex: fileExtension);
    return Container(
      width: double.maxFinite,
      margin: spacing(
        vertical: 10,
      ),
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(
          width * 0.02,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gap(h: 7),
          Container(
            width: width,
            height: height * 0.07,
            margin: spacing(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        pushRoute(
                          context: context,
                          screen: widget.post['page_id'] != '0'
                              ? PageScreen(
                                  page_id: widget.post['page_id'].toString())
                              : Profile(
                                  user_id: widget.post['publisher']['user_id']
                                      .toString(),
                                ),
                        );
                      },
                      child: Container(
                        width: width * 0.1,
                        height: width * 0.1,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: borderRadius(width),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                orangePrimary,
                                graySecondary,
                              ],
                            )),
                        padding: const EdgeInsets.all(2),
                        child: ClipRRect(
                          borderRadius: borderRadius(width),
                          child: Container(
                            width: width * 0.12,
                            child: netImage(
                              widget.post['publisher']['avatar'],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            pushRoute(
                                              context: context,
                                              screen:
                                                  widget.post['page_id'] != '0'
                                                      ? PageScreen(
                                                          page_id: widget
                                                              .post['page_id']
                                                              .toString())
                                                      : Profile(
                                                          user_id: widget
                                                              .post['publisher']
                                                                  ['user_id']
                                                              .toString(),
                                                        ),
                                            );
                                          },
                                          child: Container(
                                            child: Text(
                                              setName(widget.post['publisher']
                                                  ['name']),
                                              style: TextStyle(
                                                color: blackPrimary,
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 12,
                                              ),
                                            ),
                                          )),
                                      gap(w: 5),
                                      widget.post['group_id'] != '0'
                                          ? postFeeling(
                                              width: width,
                                              feeling:
                                                  widget.post['group_recipient']
                                                      ['group_title'],
                                              start: ' ',
                                              isGroup: true,
                                              onTap: () {
                                                pushRoute(
                                                  context: context,
                                                  screen: GroupScreen(
                                                    group_id:
                                                        widget.post['group_id'],
                                                  ),
                                                );
                                              })
                                          : gap(),
                                      gap(
                                        w: 5,
                                      ),
                                    ],
                                  ),
                                  widget.post['photo_album'].length > 0
                                      ? postFeeling(
                                          width: width,
                                          feeling: 'created an Album',
                                          start: '',
                                        )
                                      : gap(),
                                  widget.post['parent_id'] != '0'
                                      ? postFeeling(
                                          width: width,
                                          feeling: 'Revibed a post',
                                          start: '',
                                        )
                                      : gap(),
                                  postFeeling(
                                      width: width,
                                      start: 'is feeling',
                                      feeling: widget.post['postFeeling']),
                                  postFeeling(
                                      width: width,
                                      start: 'is listening',
                                      feeling: widget.post['postListening']),
                                  postFeeling(
                                      width: width,
                                      start: 'is Traveling',
                                      feeling: widget.post['postTraveling']),
                                  postFeeling(
                                      width: width,
                                      start: 'is watching',
                                      feeling: widget.post['postWatching']),
                                  postFeeling(
                                      width: width,
                                      start: 'is playing',
                                      feeling: widget.post['postPlaying']),
                                ],
                              ),
                              Row(
                                children: [
                                  widget.post['user_id'].toString() !=
                                          loginUserId
                                      ? InkWell(
                                          onTap: () {
                                            followUnfollowLikeUnlikeJoinLeave(
                                              followLikeORJoin(
                                                  post: widget.post),
                                            );

                                            setState(() {
                                              isLiked = !isLiked;
                                            });
                                          },
                                          child: Container(
                                            padding: spacing(
                                              horizontal: 15,
                                              vertical: 7,
                                            ),
                                            decoration: BoxDecoration(
                                                color:
                                                    isLiked ? grayLight : white,
                                                borderRadius: borderRadius(5),
                                                border: Border.all(
                                                    width: isLiked ? 0 : 1,
                                                    color: grayMed)),
                                            child: Text(
                                              followLikeORJoin(
                                                  post: widget
                                                      .post)['button_text'],
                                              style: TextStyle(
                                                color: grayMed,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        )
                                      : gap(),
                                  gap(w: 5),
                                  InkWell(
                                    onTap: () {
                                      createBottomModalSheet(
                                        context: context,
                                        screen: PostBottomBar(
                                          post: widget.post,
                                          is_publisher: widget.post['publisher']
                                                          ['user_id']
                                                      .toString() ==
                                                  loginUserId
                                              ? true
                                              : false,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: width * 0.06,
                                      height: width * 0.06,
                                      child: Image.asset(
                                        'assets/new/icons/more_h.png',
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        gap(h: 5),
                        Row(
                          children: [
                            Text(
                              widget.post['post_time'],
                              style: TextStyle(
                                color: grayMed,
                                fontSize: 10,
                              ),
                            ),
                            widget.post['postMap'] != ''
                                ? Row(
                                    children: [
                                      gap(
                                        w: 5,
                                      ),
                                      Icon(
                                        Icons.location_on,
                                        size: 16,
                                        color: graySecondary,
                                      ),
                                      gap(
                                        w: 5,
                                      ),
                                      Container(
                                        width: width * 0.3,
                                        child: Text(
                                          '${widget.post['postMap']}',
                                          style: TextStyle(
                                              color: graySecondary,
                                              fontSize: 12,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  )
                                : Container(),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10,
            ),
            child: Html(
              data: widget.post['postText'],
              onAnchorTap: (String? str, Map<String, String> rndr, e) {
                pushRoute(
                  context: context,
                  screen: HashTrend(
                      hashTag: e!.text.toString().contains('#')
                          ? e.text.toString().replaceFirst(RegExp(r'#'), '')
                          : e.text.toString()),
                );
              },
              style: {
                "body": Style(
                  fontSize: FontSize(12.0),
                  textOverflow: TextOverflow.ellipsis,
                  color: Colors.black54,
                  maxLines: 3,
                ),
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          widget.post['photo_album'].length > 2
              ? Container(
                  width: double.infinity,
                  height: height * 0.35,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.post['photo_album'].length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: spacing(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: borderRadius(7),
                          ),
                          child: ClipRRect(
                            borderRadius: borderRadius(7),
                            child: Stack(
                              children: [
                                netImage(
                                    widget.post['photo_album'][i]['image']),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                    padding: spacing(
                                      horizontal: 7,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius(2.5),
                                      color: const Color.fromARGB(54, 0, 0, 0),
                                    ),
                                    child: Text(
                                      '${i + 1}/${widget.post['photo_album'].length}',
                                      style: TextStyle(
                                        color: white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              : gap(),
          postFile(
            file: widget.post['postFile'],
            thumbnail: widget.post['postFileThumb'].toString(),
            post_id: widget.post['post_id'],
          ),
          gap(h: 10),
          Container(
            color: grayLight,
            padding: spacing(
              horizontal: 5,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: grayLight,
                    borderRadius: borderRadius(width),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 0,
                        height: 0,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: reactionOnPost.length,
                            reverse: true,
                            itemBuilder: (context, i) {
                              reactionsOnPostList.add(Positioned(
                                left: i * 18,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius(width),
                                  ),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: borderRadius(width),
                                      child: Image.asset(
                                        reactions[reactionOnPost[i]],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                              return Container();
                            }),
                      ),
                      Container(
                        width: 20 * reactionOnPost.length.toDouble(),
                        height: 25,
                        child: Stack(
                          children: reactionsOnPostList,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: spacing(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Row(
                    children: [
                      is_video || isAudio
                          ? InkWell(
                              onTap: () {
                                createBottomModalSheet(
                                  context: context,
                                  screen: PlayListOption(
                                    music_id: widget.post['post_id'],
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/new/images/video_icons/playlist.png',
                                color: grayMed,
                              ),
                            )
                          : gap(),
                      is_video || isAudio ? gap(w: 10) : gap(),
                      Text(
                        "${widget.post['post_comments']} Comments | ${widget.post['post_shares']} Revibed",
                        style: TextStyle(
                          color: grayMed,
                          fontSize: 10,
                        ),
                      ),
                      int.parse(widget.post['videoViews'].toString()) != 0
                          ? gap(w: 10)
                          : gap(),
                      int.parse(widget.post['videoViews'].toString()) != 0
                          ? isAudio
                              ? Text(
                                  '${getInK(number: int.parse(widget.post['videoViews'].toString()))} listen',
                                  style: TextStyle(
                                    color: grayMed,
                                    fontSize: 10,
                                  ),
                                )
                              : Text(
                                  '${getInK(number: int.parse(widget.post['videoViews']))} views',
                                  style: TextStyle(
                                    color: grayMed,
                                    fontSize: 10,
                                  ),
                                )
                          : const SizedBox(),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          gap(h: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isShowReactions = !isShowReactions;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.04,
                      height: width * 0.04,
                      child: reactionValue != 0
                          ? Image.asset(reactions[reactionValue - 1])
                          : widget.post['reaction']['is_reacted']
                              ? Image.asset(reactions[
                                  int.parse(widget.post['reaction']['type']) -
                                      1])
                              : Image.asset(
                                  'assets/new/icons/heart.png',
                                  fit: BoxFit.cover,
                                ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      reactionValue != 0
                          ? reactionsText[reactionValue - 1]
                          : widget.post['reaction']['is_reacted']
                              ? reactionsText[
                                  int.parse(widget.post['reaction']['type']) -
                                      1]
                              : 'React',
                      style: TextStyle(
                        color: grayMed,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  PostComments(
                      context: context, postId: widget.post['post_id']);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.04,
                      height: width * 0.04,
                      child: Image.asset(
                        'assets/new/icons/comment.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Comment',
                      style: TextStyle(
                        fontSize: 12,
                        color: grayMed,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  createBottomModalSheet(
                    context: context,
                    screen: Revibe(
                      post: widget.post,
                    ),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.04,
                      height: width * 0.04,
                      child: Image.asset(
                        'assets/new/icons/revibe.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Revibe',
                      style: TextStyle(
                        fontSize: 12,
                        color: grayMed,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          isShowReactions
              ? Container(
                  width: width * 0.74,
                  height: width * 0.11,
                  padding: spacing(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  margin: spacing(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                      color: white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(56, 0, 0, 0),
                          offset: Offset.zero,
                          spreadRadius: 1,
                          blurRadius: 3,
                        ),
                      ],
                      borderRadius: borderRadius(5)),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: reactions.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            isShowReactions = !isShowReactions;
                            reactionValue = i + 1;
                          });
                          reactOnPost();
                        },
                        child: Container(
                          width: width * 0.08,
                          height: width * 0.08,
                          child: Image.asset(reactions[i]),
                        ),
                      );
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
