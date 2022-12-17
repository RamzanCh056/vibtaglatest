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
  final String? email_code;
  final String? src;
  ModelUser({
   required this.first_name,
   required this.last_name,
   required this.username,
   required this.email,
   required this.avatar,
   required this.address,
   required this.about,
   required this.cover,
   required this.birthday,
   required this.user_id,
   required this.review_market,
   required this.review_login,
   required this.relationship_id,
   required this.working,
   required this.working_link,
   required this.school,
   required this.gender,
   required this.country_id,
   required this.website,
   required this.facebook,
   required this.google,
   required this.twitter,
   required this.linkedin,
   required this.youtube,
   required this.vk,
   required this.ip_address,
   required this.private_privacy,
   required this.follow_privacy,
   required this.friend_privacy,
   required this.post_privacy,
   required this.mailru,
   required this.language,
   required this.email_code,
   required this.src,
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
      'email_code': email_code,
      'src': src,
    };
  }

  factory ModelUser.fromMap(Map<String, dynamic> map) {
    return ModelUser(
      first_name: map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      about: map['about'] != null ? map['about'] as String : null,
      cover: map['cover'] != null ? map['cover'] as String : null,
      birthday: map['birthday'] != null ? map['birthday'] as String : null,
      user_id: map['user_id'] != null ? map['user_id'] as String : null,
      review_market: map['review_market'] != null ? map['review_market'] as String : null,
      review_login: map['review_login'] != null ? map['review_login'] as String : null,
      relationship_id: map['relationship_id'] != null ? map['relationship_id'] as String : null,
      working: map['working'] != null ? map['working'] as String : null,
      working_link: map['working_link'] != null ? map['working_link'] as String : null,
      school: map['school'] != null ? map['school'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      country_id: map['country_id'] != null ? map['country_id'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
      facebook: map['facebook'] != null ? map['facebook'] as String : null,
      google: map['google'] != null ? map['google'] as String : null,
      twitter: map['twitter'] != null ? map['twitter'] as String : null,
      linkedin: map['linkedin'] != null ? map['linkedin'] as String : null,
      youtube: map['youtube'] != null ? map['youtube'] as String : null,
      vk: map['vk'] != null ? map['vk'] as String : null,
      ip_address: map['ip_address'] != null ? map['ip_address'] as String : null,
      private_privacy: map['private_privacy'] != null ? map['private_privacy'] as String : null,
      follow_privacy: map['follow_privacy'] != null ? map['follow_privacy'] as String : null,
      friend_privacy: map['friend_privacy'] != null ? map['friend_privacy'] as String : null,
      post_privacy: map['post_privacy'] != null ? map['post_privacy'] as String : null,
      mailru: map['mailru'] != null ? map['mailru'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
      email_code: map['email_code'] != null ? map['email_code'] as String : null,
      src: map['src'] != null ? map['src'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelUser.fromJson(String source) => ModelUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
