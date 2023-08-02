import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/hast_tag/tred_screen.dart';
import 'package:vibetag/screens/header/header.dart';
import 'package:vibetag/screens/order_email/oder_deliver_email.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/navbar.dart';
import '../register/reusabletext.dart';

class BlogDetailScreen extends StatefulWidget {
  Map<String, dynamic> blog;

  BlogDetailScreen({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  List<dynamic> readmoreBlogs = [];

  bool isSeeMore = false;
  bool isLoadingReadMore = false;
  String seeMoreText = 'See more';
  getReadMoreBlogs() async {
    setState(() {
      isLoadingReadMore = true;
    });
    final response = await API().newPostData({
      'type': 'blog-operations',
      'sub_type': 'get-popular-articles',
      'user_id': '${loginUserId}',
    });
    readmoreBlogs = response['popular_articles'];
    setState(() {
      isLoadingReadMore = false;
    });
  }

  @override
  void initState() {
    getReadMoreBlogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String blogContent = widget.blog['content'] == null
        ? widget.blog['blog']['content']
        : widget.blog['content'];
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF1F4FB),
      body: ListView(
        children: [
          NavBar(),
          Header(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_outlined,
                        color: Color(0xff485470))),
                SizedBox(
                  width: 5,
                ),
                ReusableText(
                  title: 'Go back',
                  size: 16,
                  weight: FontWeight.w700,
                  color: Color(0xff485470),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffFFFFFF),
              boxShadow: lightShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: radiusOnly(topLeft: 10, topRight: 10),
                  child: Image(
                    width: MediaQuery.of(context).size.width * 1 - 10,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      widget.blog['thumbnail'] == null
                          ? widget.blog['blog']['thumbnail']
                          : widget.blog['thumbnail'],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderDeliveredEmail()));
                          });
                        },
                        child: Container(
                          width: 140,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xffFF9200).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: ReusableText(
                              title: widget.blog['tags'] == null
                                  ? widget.blog['blog']['tags']
                                  : widget.blog['tags'],
                              size: 14,
                              weight: FontWeight.w600,
                              color: Color(0xffFF9200),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReusableText(
                        title: widget.blog['title'] == null
                            ? widget.blog['blog']['title']
                            : widget.blog['title'],
                        size: 16,
                        weight: FontWeight.w700,
                        color: Color(0xff212121),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: borderRadius(width),
                            child: Container(
                              width: 50,
                              height: 50,
                              child: Image(
                                image: NetworkImage(
                                  widget.blog['author']['avatar'] == null
                                      ? widget.blog['blog']['author']['avatar']
                                      : widget.blog['author']['avatar'],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableText(
                                title: widget.blog['author']['name'] == null
                                    ? widget.blog['blog']['author']['name']
                                    : widget.blog['author']['name'],
                                size: 13,
                                weight: FontWeight.w700,
                                color: Color(0xff212121),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              ReusableText(
                                title: widget.blog['posted'] == null
                                    ? widget.blog['post_time']
                                    : widget.blog['posted'],
                                size: 10,
                                weight: FontWeight.w500,
                                color: Color(0xff7D8CAC),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.more_horiz,
                            color: Color(0xffC8D1E5),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 2,
                        height: 2,
                        color: Color(0xffF1F4FB),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Html(
                        data: blogContent.length < 180
                            ? blogContent
                            : isSeeMore
                                ? '${blogContent}  <a href="#"><strong style="color:orange;font-size:13px;"><b>${seeMoreText}</b></strong></a>'
                                : '${blogContent.toString().substring(0, 150)}  <a href="#"><strong style="color:orange;font-size:13px;"><b>${seeMoreText}</b></strong></a>',
                        onAnchorTap: (str, map, e) {
                          if (e!.text.toString() == 'See less' ||
                              e.text.toString() == 'See more') {
                            isSeeMore = !isSeeMore;
                            seeMoreText = isSeeMore ? 'See less' : 'See more';
                            setState(() {});
                          } else {
                            pushRoute(
                              context: context,
                              screen: HashTrend(
                                  hashTag: e.text.toString().contains('#')
                                      ? e.text
                                          .toString()
                                          .replaceFirst(RegExp(r'#'), '')
                                      : e.text.toString()),
                            );
                          }
                        },
                        style: {
                          "body": Style(
                              fontSize: FontSize(14.0),
                              textOverflow: TextOverflow.ellipsis,
                              color: lightblue,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Manrope',
                              maxLines: isSeeMore
                                  ? blogContent.toString().length % 150
                                  : 3),
                          'a': Style(
                            color: orangePrimary,
                          )
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 265,
            decoration: BoxDecoration(
              color: white,
              boxShadow: lightShadow,
              borderRadius: borderRadius(10),
            ),
            padding: spacing(horizontal: 10, vertical: 15),
            margin: spacing(horizontal: 10),
            child: Column(
              children: [
                Container(
                  width: width,
                  child: Row(
                    children: [
                      Container(
                        padding: spacing(horizontal: 7, vertical: 7),
                        decoration: BoxDecoration(
                          color: orange,
                          borderRadius: borderRadius(width),
                        ),
                        child: Icon(
                          Icons.read_more,
                          color: white,
                        ),
                      ),
                      gap(w: 10),
                      Text(
                        'Read more',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
                gap(h: 7),
                Container(
                  height: 2,
                  width: width,
                  color: lightGrayNew,
                ),
                gap(h: 7),
                isLoadingReadMore
                    ? loadingSpinner()
                    : Container(
                        width: width,
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: readmoreBlogs.length,
                          itemBuilder: (context, i) {
                            return Container(
                              width: width * 0.5,
                              decoration: BoxDecoration(
                                color: white,
                                boxShadow: lightShadow,
                                borderRadius: borderRadius(7),
                              ),
                              margin: spacing(horizontal: 2.5, vertical: 7),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        radiusOnly(topLeft: 7, topRight: 7),
                                    child: Container(
                                      height: 120,
                                      child: Image.network(
                                        readmoreBlogs[i]['thumbnail'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  gap(h: 2),
                                  Container(
                                    margin: spacing(horizontal: 5),
                                    child: Text(
                                      readmoreBlogs[i]['title'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  gap(h: 5),
                                  Container(
                                    margin: spacing(horizontal: 5),
                                    child: Text(
                                      DateFormat('yMMMd').format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            int.parse(
                                                  readmoreBlogs[i]['posted']
                                                      .toString(),
                                                ) *
                                                1000),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
          gap(h: 30),
        ],
      ),
    ));
  }
}
