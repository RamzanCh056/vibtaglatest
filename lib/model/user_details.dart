import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserDetails {
  final String post_count;
  final String album_count;
  final String following_count;
  final String followers_count;
  final String groups_count;
  final String likes_count;
  final String video_views;
  final int total_reactions;
  UserDetails({
    required this.post_count,
    required this.album_count,
    required this.following_count,
    required this.followers_count,
    required this.groups_count,
    required this.likes_count,
    required this.video_views,
    required this.total_reactions,
  });

  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'post_count': post_count,
      'album_count': album_count,
      'following_count': following_count,
      'followers_count': followers_count,
      'groups_count': groups_count,
      'likes_count': likes_count,
      'video_views': video_views,
      'total_reactions': total_reactions,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      post_count: map['post_count'] as String,
      album_count: map['album_count'] as String,
      following_count: map['following_count'] as String,
      followers_count: map['followers_count'] as String,
      groups_count: map['groups_count'] as String,
      likes_count: map['likes_count'] as String,
      video_views: map['video_views'] as String,
      total_reactions: map['total_reactions'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson(String source) => UserDetails.fromMap(json.decode(source) as Map<String, dynamic>);
}
