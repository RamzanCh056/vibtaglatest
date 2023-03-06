import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:vibetag/screens/home/create_post/audience_option.dart';
import 'package:vibetag/screens/home/create_post/category_option.dart';
import 'package:vibetag/utils/constant.dart';

class PostCategory extends StatefulWidget {
  const PostCategory({super.key});

  @override
  State<PostCategory> createState() => _PostCategoryState();
}

class _PostCategoryState extends State<PostCategory> {
  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context: context);
    double height = deviceHeight(context: context);
    return Container(
      height: height * 0.75,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: spacing(
              horizontal: 25,
            ),
            child: Container(
              padding: spacing(
                vertical: 20,
              ),
              child: Text(
                'Edit Category',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            height: 2,
            width: double.maxFinite,
            color: grayMed,
          ),
          gap(h: 15),
          categoryOptions(
            title: 'Lifestyle',
            tags: [
              'Beauty',
              'Crookery',
              'Entertainment',
              'Education',
              'Shoppings',
              'Style',
            ],
          ),
          categoryOptions(
            title: 'Music/Audio',
            tags: [
              'Beauty',
              'Crookery',
              'Entertainment',
              'Education',
              'Shoppings',
              'Style',
            ],
          ),
          categoryOptions(
            title: 'Music/Audio',
            tags: [
              'Beauty',
              'Crookery',
              'Entertainment',
              'Education',
              'Shoppings',
              'Style',
            ],
          ),
          categoryOptions(
            title: 'Music/Audio',
            tags: [
              'Beauty',
              'Crookery',
              'Entertainment',
              'Education',
              'Shoppings',
              'Style',
            ],
          ),
          gap(h: 30),
          Container(
            margin: spacing(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.35,
                  padding: spacing(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: borderRadius(10),
                    color: grayLight,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: grayMed,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                gap(w: 10),
                Container(
                  width: width * 0.35,
                  padding: spacing(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: borderRadius(10),
                    gradient: gradient,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
