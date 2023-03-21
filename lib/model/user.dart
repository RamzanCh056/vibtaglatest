// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelUser {
  final String? first_name;
  final String? last_name;
  final String? username;
  final String? email;
  final String? avatar;
  final String? address;
  final String? about;
  final String? cover;
  final String? birthday;
  final String? user_id;
  final String? review_market;
  final String? review_login;
  final String? relationship_id;
  final String? working;
  final String? working_link;
  final String? school;
  final String? gender;
  final String? country_id;
  final String? website;
  final String? facebook;
  final String? google;
  final String? twitter;
  final String? linkedin;
  final String? youtube;
  final String? vk;
  final String? ip_address;
  final String? private_privacy;
  final String? follow_privacy;
  final String? friend_privacy;
  final String? post_privacy;
  final String? mailru;
  final String? language;
  final String? order_posts_by;
  final String? email_code;
  final String? following_number;
  final String? src;
  final String? verified;
  final List<dynamic>? following_data;
  final List<dynamic>? likes_data;
  final List<dynamic>? groups_data;
  ModelUser({
    this.first_name,
    this.last_name,
    this.username,
    this.email,
    this.avatar,
    this.address,
    this.about,
    this.cover,
    this.birthday,
    this.user_id,
    this.review_market,
    this.review_login,
    this.relationship_id,
    this.working,
    this.working_link,
    this.school,
    this.gender,
    this.country_id,
    this.website,
    this.facebook,
    this.google,
    this.twitter,
    this.linkedin,
    this.youtube,
    this.vk,
    this.ip_address,
    this.private_privacy,
    this.follow_privacy,
    this.friend_privacy,
    this.post_privacy,
    this.mailru,
    this.language,
    this.order_posts_by,
    this.email_code,
    this.following_number,
    this.src,
    this.verified,
    this.following_data,
    this.likes_data,
    this.groups_data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': first_name,
      'last_name': last_name,
      'username': username,
      'email': email,
      'avatar': avatar,
      'address': address,
      'about': about,
      'cover': cover,
      'birthday': birthday,
      'user_id': user_id,
      'review_market': review_market,
      'review_login': review_login,
      'relationship_id': relationship_id,
      'working': working,
      'working_link': working_link,
      'school': school,
      'gender': gender,
      'country_id': country_id,
      'website': website,
      'facebook': facebook,
      'google': google,
      'twitter': twitter,
      'linkedin': linkedin,
      'youtube': youtube,
      'vk': vk,
      'ip_address': ip_address,
      'private_privacy': private_privacy,
      'follow_privacy': follow_privacy,
      'friend_privacy': friend_privacy,
      'post_privacy': post_privacy,
      'mailru': mailru,
      'language': language,
      'order_posts_by': order_posts_by,
      'email_code': email_code,
      'following_number': following_number,
      'src': src,
      'verified': verified,
      'following_data': following_data,
      'likes_data': likes_data,
      'groups_data': groups_data,
    };
  }

  factory ModelUser.fromMap(Map<String, dynamic> map) {
    return ModelUser(
      first_name:
          map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      about: map['about'] != null ? map['about'] as String : null,
      cover: map['cover'] != null ? map['cover'] as String : null,
      birthday: map['birthday'] != null ? map['birthday'] as String : null,
      user_id: map['user_id'] != null ? map['user_id'] as String : null,
      review_market:
          map['review_market'] != null ? map['review_market'] as String : null,
      review_login:
          map['review_login'] != null ? map['review_login'] as String : null,
      relationship_id: map['relationship_id'] != null
          ? map['relationship_id'] as String
          : null,
      working: map['working'] != null ? map['working'] as String : null,
      working_link:
          map['working_link'] != null ? map['working_link'] as String : null,
      school: map['school'] != null ? map['school'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      country_id:
          map['country_id'] != null ? map['country_id'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
      facebook: map['facebook'] != null ? map['facebook'] as String : null,
      google: map['google'] != null ? map['google'] as String : null,
      twitter: map['twitter'] != null ? map['twitter'] as String : null,
      linkedin: map['linkedin'] != null ? map['linkedin'] as String : null,
      youtube: map['youtube'] != null ? map['youtube'] as String : null,
      vk: map['vk'] != null ? map['vk'] as String : null,
      ip_address:
          map['ip_address'] != null ? map['ip_address'] as String : null,
      private_privacy: map['private_privacy'] != null
          ? map['private_privacy'] as String
          : null,
      follow_privacy: map['follow_privacy'] != null
          ? map['follow_privacy'] as String
          : null,
      friend_privacy: map['friend_privacy'] != null
          ? map['friend_privacy'] as String
          : null,
      post_privacy:
          map['post_privacy'] != null ? map['post_privacy'] as String : null,
      mailru: map['mailru'] != null ? map['mailru'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
      order_posts_by: map['order_posts_by'] != null
          ? map['order_posts_by'] as String
          : null,
      email_code:
          map['email_code'] != null ? map['email_code'] as String : null,
      following_number: map['following_number'] != null
          ? map['following_number'] as String
          : null,
      src: map['src'] != null ? map['src'] as String : null,
      verified: map['verified'] != null ? map['verified'] as String : null,
      following_data: map['following_data'] != null
          ? List<dynamic>.from((map['following_data'] as List<dynamic>))
          : null,
      likes_data: map['likes_data'] != null
          ? List<dynamic>.from((map['likes_data'] as List<dynamic>))
          : null,
      groups_data: map['groups_data'] != null
          ? List<dynamic>.from((map['groups_data'] as List<dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelUser.fromJson(String source) =>
      ModelUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
