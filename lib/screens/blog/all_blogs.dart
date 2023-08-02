import 'package:flutter/material.dart';
import 'package:vibetag/methods/api.dart';
import 'package:vibetag/screens/blog/blog_widget.dart';
import 'package:vibetag/utils/constant.dart';

class AllBlogs extends StatefulWidget {
  const AllBlogs({super.key});

  @override
  State<AllBlogs> createState() => _AllBlogsState();
}

class _AllBlogsState extends State<AllBlogs> {
  List<dynamic> blogpost = [];
  List<Widget> blogList = [];
  List<String> buttons = ['See All', 'Recent', 'Popular'];
  List<dynamic> loadCategories = [];
  int activeButton = 0;
  String categoryId = '';
  String categoryName = '';

  bool isLoading = false;
  getMyBlogs() async {
    if (loadCategories.length == 0) {
      await getCategories();
    }
    blogList = [];
    setState(() {
      isLoading = true;
    });
    final response = await API().newPostData({
      'type': 'blog-operations',
      'sub_type': 'get_lasted_blogs',
      'user_id': loginUserId,
      'category_id': categoryId,
      'offset': '',
      'limit': '15',
      'blog_user_id': '',
      'blog_id': '',
      'keyword': '',
    });
    blogpost = response['blogs'];
    

    for (var singleBlog in blogpost) {
      blogList.add(
        BlogWidget(blog: singleBlog),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  getBlogsByCategory() async {
    blogList = [];
    setState(() {
      isLoading = true;
    });
    for (var cat in loadCategories) {
      if (cat['name'].toString() == categoryName) {
        categoryId = cat['id'].toString();
      }
    }
   
    final response = await API().newPostData({
      'type': 'blog-operations',
      'sub_type': 'get_lasted_blogs',
      'user_id': loginUserId,
      'category_id': categoryId,
      'offset': '',
      'limit': '15',
      'blog_user_id': '',
      'blog_id': '',
      'keyword': '',
    });
    blogpost = response['blogs'];
    for (var singleBlog in blogpost) {
      blogList.add(
        BlogWidget(blog: singleBlog),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  getRecentBlogs() async {
    blogList = [];
    setState(() {
      isLoading = true;
    });
    final response = await API().newPostData({
      'type': 'blog-operations',
      'sub_type': 'get-recent-articles',
      'user_id': loginUserId,
    });
    blogpost = response['articles'];
    for (var singleBlog in blogpost) {
      blogList.add(
        BlogWidget(blog: singleBlog),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  getPopularBlogs() async {
    blogList = [];
    setState(() {
      isLoading = true;
    });
    final response = await API().newPostData({
      'type': 'blog-operations',
      'sub_type': 'get-popular-articles',
      'user_id': loginUserId,
    });
    blogpost = response['popular_articles'];
    for (var singleBlog in blogpost) {
      blogList.add(
        BlogWidget(blog: singleBlog),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> getCategories() async {
    final response = await API().newPostData({
      'type': 'blog-operations',
      'sub_type': 'get-blogs-categories',
    });

    loadCategories = response['categories'];
    loadCategories.shuffle();
    for (var category in loadCategories) {
      buttons.add(category['name'].toString());
    }
  }

  @override
  void initState() {
    getMyBlogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loadingSpinner()
        : Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: 35,
                margin: spacing(
                  horizontal: 5,
                  vertical: 10,
                ),
                alignment: Alignment.center,
                child: ListView.builder(
                  itemCount: buttons.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        if (i != activeButton) {
                          activeButton = i;
                          setState(() {});
                          if (i == 0) {
                            getMyBlogs();
                          } else if (i == 1) {
                            getRecentBlogs();
                          } else if (i == 2) {
                            getPopularBlogs();
                          } else {
                            categoryName=buttons[i].toString();
                            getBlogsByCategory();
                          }
                        }
                      },
                      child: Container(
                        margin: spacing(horizontal: 5),
                        padding: spacing(horizontal: 25, vertical: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: white,
                          border: Border.all(
                            width: 1,
                            color: activeButton == i ? orange : white,
                          ),
                          borderRadius: borderRadius(15),
                          boxShadow: activeButton == i ? lightShadow : [],
                        ),
                        child: Text(
                          buttons[i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: activeButton == i ? orange : blackPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: Column(
                  children: blogList,
                ),
              ),
            ],
          );
  }
}
