import 'package:flutter/material.dart';
import 'package:vibetag/screens/blog/Entertainment_click.dart';
import 'package:vibetag/screens/blog/all_blogs.dart';
import 'package:vibetag/screens/header/header.dart';
import 'package:vibetag/utils/constant.dart';
import 'package:vibetag/widgets/navbar.dart';

import '../register/reusabletext.dart';

class Blogs extends StatefulWidget {
  const Blogs({
    Key? key,
  }) : super(key: key);

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF1F4FB),
      body: ListView(
        children: [
          NavBar(),
          Header(),
          AllBlogs(),
        ],
      ),
    ));
  }
}
