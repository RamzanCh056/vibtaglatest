// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelUser {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String avatar;
  final String address;
  final String about;
  final String cover;
  final String birthday;
  final int userId;

  ModelUser({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.avatar,
    required this.address,
    required this.about,
    required this.cover,
    required this.birthday,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'avatar': avatar,
      'address': address,
      'about': about,
      'cover': cover,
      'birthday': birthday,
      'userId': userId,
    };
  }

  factory ModelUser.fromMap(Map<String, dynamic> map) {
    return ModelUser(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      avatar: map['avatar'] as String,
      address: map['address'] as String,
      about: map['about'] as String,
      cover: map['cover'] as String,
      birthday: map['birthday'] as String,
      userId: map['userId'] as int,
    );
  }
}
