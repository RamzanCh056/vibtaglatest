// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  List<dynamic> posts = [];
  PostModel({
    required this.posts,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'posts': posts,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      posts: List<dynamic>.from((map['posts'] as List<dynamic>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
